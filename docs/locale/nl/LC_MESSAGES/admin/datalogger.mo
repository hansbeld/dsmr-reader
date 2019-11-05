��    	      d      �       �      �   �   �   �   �  z   �    *  �   I     G  �   X  0       3    E  &  L  �   s	  '  
  -  ;     i  �   �                                          	    Admin: Datalogger By default all DSMR-readings read by of sent to the application are stored indefinitely. DSMR v5 smart meters allow DSMR-readings to be recorded every second, resulting in over 30 million readings each year. Configure the builtin datalogger. You can choose to have electricity phases tracked as well. The advanced options allow you to change the DSMR protocol version, but the default (v4/v5) should do fine for any recent placed smart meters. Enabling retention will prevent you from regenerating past day statistics with different prices (due to loss of accuracy). Eventually this **will cause degraded performance** in the application/database and for that reason you might want to apply retention to this data. Please note that enabling this feature will **not discard all readings**, as it will **preserve the first and last reading of each hour**. Historic data, such as Hour and Day Statistics are unaffected. These are aggregated from the Electricity & Gas Consumption data above. This is also the only data that should matter when you want to look back to a specific day, month or year in the past. Notes / warnings PostgreSQL does not free up unused disk space immediately. If you've enabled retention for the first time, make sure to run the following command once after a few days:: Project-Id-Version:  DSMR-reader
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2018-10-16 18:16+0200
Last-Translator: 
Language: nl_NL
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 Admin: Datalogger Standaard worden alle DSMR-metingen oneindig bewaard. Deze zijn gelezen door (of opgestuurd naar) de applicatie. DSMR v5 slimme meters staan toe dat er elke seconde een meting gedaan wordt, waardoor er tot meer dan 30 miljoen metingen per jaar opgeslagen worden. Configureer de ingebouwde datalogger. Je kunt ervoor kiezen om eventueel elektriciteitsfasen te laten bijhouden. De geavanceerde opties staan je toe om de versie van het DSMR-protocol te wijzigen. Echter, de standaard (v4/v5) is prima in de meeste gevallen voor recent geplaatste slimme meters. Het inschakelen van retentie heeft als gevolg dat je oude dagstatistieken niet opnieuw kan hergenereren met een andere prijs (door verlies van nauwkeurigheid). Uiteindelijk zorgt dit voor **slechtere performance** in ofwel de applicatie of database. Daarom zul je wellicht retentie willen toepassen op deze gegevens. Let op: Het inschakelen van deze feature **gooit niet alle metingen weg**, want **van elk uur wordt de eerste en laatste meting bewaard**. Historische gegevens, zoals Dag- en Uurstatistieken worden buiten beschouwing gelaten. Deze gegevens stammen af van bovenstaande consumptie en zijn tevens de enige belangrijke data die er voor de lange termijn toe doen. Bijvoorbeeld wanneer je terug wilt kijken naar een specifieke dag, maand of jaar. Opmerkingen / waarschuwingen PostgreSQL geeft ongebruikte schijfruimte niet direct vrij. Wanneer je voor het eerst retentie hebt ingeschakeld, zorg er voor dat je na een aantal dagen het volgende ten minste één keer uitvoert:: 