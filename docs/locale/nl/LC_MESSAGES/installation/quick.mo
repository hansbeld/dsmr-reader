��          �      �       H  B   I  
   �  C   �  ^   �     :  #   N     r     �  H   �     �  �   �  �   �  "   p  �  �  ?   7     w  B   �  m   �     4  '   F     n     �  I   �     �  �   �  �   �  &   �	                                             
                	    :doc:`Finished? Go to setting up the application<../application>`. Continue:: Does PostgreSQL not start/create the cluster due to locales? E.g.:: If you need to restore a database backup with your existing data, this is the moment to do so. Installation: Quick Optional: Restore a database backup Quick installation, part 1 Quick installation, part 2 Restoring a database backup? :doc:`See for instructions here <restore>`. Start:: Still no luck? Try editing ``/etc/environment``, add ``LC_ALL="en_US.utf-8"`` and reboot. Then try ``pg_createcluster 9.4 main --start`` again (or whatever version you are using). The installation guide may take about *15 to 30 minutes* (for raspberryPi 2/3), but it greatly depends on your Linux skills and whether you need to understand every step described in this guide. Try: ``dpkg-reconfigure locales``. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
X-Generator: Poedit 2.0.6
 :doc:`Klaar? Ga dan naar applicatie instellen<../application>`. Ga verder:: Start PostgreSQL niet wegens een fout in 'locales'? Bijvoorbeeld:: Indien je een back-up van de database wilt terugzetten met je oude gegevens, nu is het moment om dat te doen. Installatie: Snel Optioneel: Database back-up terugzetten Snelle installatie, deel 1 Snelle installatie, deel 2 Database back-up terugzetten? :doc:`Zie hier voor instructies <restore>`. Begin:: Werkt het nog steeds niet? Open dan dit bestand ``/etc/environment``, voeg onderaan de regel ``LC_ALL="en_US.utf-8"`` toe en herstart het systeem. Probeer daarna ``pg_createcluster 9.4 main --start`` (of welke versie je ook gebruikt). Het installeren duurt naar verwachting zo'n *15 a 30 minuten* (op een RaspberryPi 2/3), maar hangt natuurlijk ook af van je eigen vaardigheid op de command line. Probeer: ``dpkg-reconfigure locales``. 