��    
      l      �       �   �   �       �  �        �  K   �  4     *   :  :   e     �  �  �    �     �  �   �     R  O   j  D   �  /   �  9   /  )   i                      	      
                 Each release `has it's database migrations locked<https://github.com/dennissiemensma/dsmr-reader/tree/v4/dsmrreader/provisioning/downgrade>`. You should execute the script of the version you wish to downgrade to. And the switch the code to the release. FAQ: Downgrading the application First, **please make sure you have a recent backup of your database**! :doc:`More information about backups can be found here<../data_integrity>`. For example ``v4.0``:: If for some reason you need to downgrade the application, you will need to: Unapplying the database migrations may take a while. You should now be on the targeted release. switch the application code version to a previous release. unapply database migrations. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
X-Generator: Poedit 2.0.6
 Elke release `heeft z'n eigen databasemigraties vastgelegd<https://github.com/dennissiemensma/dsmr-reader/tree/v4/dsmrreader/provisioning/downgrade>`. Je zult het script moeten uitvoer voor de release waar je naar toe wilt. En vervolgens de codebase wisselen naar dezelfde release. FAQ: Applicatie downgraden Allereerst, **zorg ervoor dat je een recente backup hebt van je database**! :doc:`Meer informatie over back-ups vind je hier<../data_integrity>`. Bijvoorbeeld ``v4.0``:: Wanneer je om wat voor reden dan ook de applicatie moet downgraden, dan zul je: Het terugdraaien van databasemigraties kan wat tijd in beslag nemen. Je zou nu op de gewenste release moeten zitten. de applicatiecode moeten wisselen naar een vorige versie. de databasemigraties moeten terugdraaien. 