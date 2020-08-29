from decimal import Decimal
import logging

from django.utils.translation import gettext_lazy as _
from django.utils import timezone
from django.conf import settings
import requests

from dsmr_tado.models.settings import TadoSettings
from dsmr_tado.models.reading import TemperatureReading


logger = logging.getLogger('dsmrreader')


def run(scheduled_process):
    """ Reads the current weather state and stores it. """
    try:
        temperature_reading = get_temperature_from_api()
    except Exception as error:
        logger.exception(error)

        scheduled_process.delay(timezone.timedelta(hours=1))
        return

    scheduled_process.reschedule(temperature_reading.read_at + timezone.timedelta(hours=1))


def get_temperature_from_api():
    # For backend logging in Supervisor.
    logger.debug('Buienradar: Reading temperature: %s', settings.DSMRREADER_BUIENRADAR_API_URL)

    try:
        url = 'https://auth.tado.com/oauth/token'
        payload =  {'client_id:tado-web-app'
            'grant_type:password',
            'scope:home.user',
            'username:hbeld@icloud.com',
            'password:bidqIb-dyzji7-mocdec',
            'client_secret:wZaRN7rpjn3FoNyF5IFuxg9uMzYJcvOoQ8QWiIqS3hfk6gLhVlG57j5YNoZL2Rtc'}
        response = requests.post(url, data=payload)
        
        # response = requests.get(settings.DSMRREADER_BUIENRADAR_API_URL)
    except Exception as error:
        logger.exception(error)
        raise AssertionError(_('Failed to connect to or read from Buienradar API'))

    if response.status_code != 200:
        logger.error('Buienradar: Failed reading temperature: HTTP %s', response.status_code)
        raise AssertionError(_('Unexpected status code received'))

    # Get access token
    token = response.json()['access_token']

    # Get zone
    try:
        url = 'https://my.tado.com/api/v2/homes/505213/zones/2/dayReport?date=2020-08-19'
        headers = {'Authorization' : 'Bearer ' + token }
        
        dayresponse = requests.get(url, headers=headers)
        logger.info(dayresponse)

    except Exception as error:
        logger.exception(error)
        raise AssertionError(_('Failed to connect to or read from Tado API'))

    if dayresponse.status_code != 200:
        logger.error('Buienradar: Failed reading temperature: HTTP %s', response.status_code)
        raise AssertionError(_('Unexpected status code received'))

    temperature = dayresponse.json()['measuredData']['insideTemperature']['datapoints'][-1]['value']['celsius']

    hour_mark = timezone.now().replace(minute=0, second=0, microsecond=0)
    return TemperatureReading.objects.create(read_at=hour_mark, degrees_celcius=Decimal(temperature))

     
    # Find our selected station.
    
    #station_id = WeatherSettings.get_solo().buienradar_station
    #station_data = [x for x in response.json()['actual']['stationmeasurements'] if x['stationid'] == station_id]

    #if not station_data:
    #    raise AssertionError(_('Selected station info not found'))

    #temperature = station_data[0]['groundtemperature']
    #logger.debug('Buienradar: Read temperature: %s', temperature)

    #hour_mark = timezone.now().replace(minute=0, second=0, microsecond=0)
    #return TemperatureReading.objects.create(read_at=hour_mark, degrees_celcius=Decimal(temperature))
