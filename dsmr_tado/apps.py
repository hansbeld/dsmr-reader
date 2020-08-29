import logging

from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


logger = logging.getLogger('dsmrreader')


class TadoAppConfig(AppConfig):
    name = 'dsmr_tado'
    verbose_name = _('Tado')
