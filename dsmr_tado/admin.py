from django.conf import settings
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from django.contrib import admin
from solo.admin import SingletonModelAdmin
import django.db.models.signals

from dsmr_backend.models.schedule import ScheduledProcess
from dsmr_tado.models.settings import TadoSettings


@admin.register(TadoSettings)
class TadoSettingsAdmin(SingletonModelAdmin):
    fieldsets = (
        (
            None, {
                'fields': ['track'],
            }
        ),
        (
            _('Buienradar'), {
                'fields': ['buienradar_station'],
                'description': _(
                    'See <a href="https://www.buienradar.nl/nederland/weerbericht/weerstations" target="_blank">'
                    'Buienradar weerstations</a> for a map of all locations.')
            }
        ),
    )


@receiver(django.db.models.signals.post_save, sender=TadoSettings)
def handle_weather_settings_update(sender, instance, **kwargs):
    """ Hook to toggle related scheduled process. """
    ScheduledProcess.objects.filter(
        module=settings.DSMRREADER_MODULE_WEATHER_UPDATE
    ).update(active=instance.track)
