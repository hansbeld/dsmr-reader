��    ,      |  ;   �      �  /   �  �   �  �   �     �  .   �     �     �     �  �   �  �   �  w   c  T   �  �   0     �  q   `	  �   �	  �   �
  �   k  ^     �   d  �   �  �   }  7   &     ^  -   �  5     T   B  \   �     �       X     G   u  7   �  �   �  �   �     <     R  �  j  �     ;   �  �   
  �   �  �   �  �  �  4   ]  �   �    :     K  4   \     �     �     �  �   �  �   �  �   b  f   �  �   X  �   	  Y   �  �      �   �   �   �!  {   D"  �   �"  �   V#  �   �#  I   �$  �   �$  0   Y%  C   �%     �%  b   N&  '   �&     �&  h   �&  5   P'  A   �'  �   �'  �   �(     b)     z)  @  �)  �   �*  O   �+  �   �+    �,    �-     "       +            	                    '   &      *                 %   )              ,                             $         #              
       !                          (                        :doc:`This information can be found here<faq>`. Also, check your free disk space once in a while. I will implement automatic cleanup settings later, allowing you to choose your own retention (for all the source readings). Alternatively you can generate a ``htpasswd`` file locally, by installing ``sudo apt-get install apache2-utils`` and running ``sudo htpasswd -c /etc/nginx/htpasswd USERNAME`` (where ``USERNAME`` is your desired username). And reload with:: Application updates (bug fixes & new features) Contents DSMR 2.x (legacy) Data preservation & backups Did you install using a monitor attached to the RaspberryPi and you don't know what address your device has? Just type ``ifconfig | grep addr`` and it should display an ip address, for example:: Don't forget to run ``./post-deploy.sh`` in the project's root, which will force the application to gracefully reload itself and apply the new settings instantly. Everything OK? Congratulations, this was the hardest part and now the fun begins by monitoring your energy consumption. For **MySQL/MariaDB** you can use ``dsmrreader/provisioning/mysql/mysql-backup.sh``. For more information about (optionally) setting up an USB drive for backups, see `Data preservation/backups #268 <https://github.com/dennissiemensma/dsmr-reader/issues/268>`_. However, as the data is still stored **locally** on your 'vulnerable' SD card, you must export it off your RaspberryPi as well. If you expose your application to the outside world or a public network, you might want to take additional steps: In this example the ip address is ``192.168.178.150``. If possible, you should assign a static ip address to your device in your router. This will make sure you will always be able to find the application at the same location. Install a firewall, such as ``ufw`` `UncomplicatedFirewall <https://wiki.ubuntu.com/UncomplicatedFirewall>`_ and restrict traffic to port ``22`` (only for yourself) and port ``80``. It's safe to use a htpasswd generator, **just make sure to NEVER enter personal credentials** there **used for other applications or personal accounts**. Make sure to alter this setting in the backend's configuration page to DSMR 2.x when required! Make sure to schedule the backup scripts as cronjob and also verify that it actually works, by running ``run-parts -v /etc/cron.daily``. Note: The application's default DSMR version used is 4.x. This version is also the **default** for any recent smart meters placed at your home. Now it's time to view the application in your browser to check whether the GUI works as well. Just enter the ip address or hostname of your RaspberryPi in your browser. Now make sure you didn't insert any typo's by running:: Open the site's vhost in ``/etc/nginx/sites-enabled/dsmr-webinterface`` and **uncomment** the following lines (remove the ##):: Optional: Setting up an USB drive for backups Paste the htpasswd string in ``/etc/nginx/htpasswd``. Please either use this service or manage offloading backups on your own (see below). Please make sure to **alter** the ``SECRET_KEY`` setting in your ``dsmrreader/settings.py``. Public webinterface warning Reboot test The SD card is by far **the weakest link** of this setup and **will** fail you some day. The application will, by default, create a database backup every night. The command will prompt you to enter a password for it. There are example backup scripts available in ``dsmrreader/provisioning/postgresql/psql-backup.sh`` for **PostgreSQL**, which I dump to a separately USB stick mounted on my RaspberryPi. There is an builtin option to have backups synced to your **Dropbox**, *without exposing your Dropbox account and your private files in it*. Using the application Viewing the application You **should (or must)** make sure to periodically BACKUP your data! It's one of the most common mistakes to skip or ignore this. Actually, it happened to myself quite soon after I started, as I somehow managed to corrupt my SD storage card, losing all my data on it. It luckily happened only a month after running my own readings, but imagine all the data you'll lose when it will contain readings taken over several years. You can find them in the ``backups`` folder of the application. They either have a ``.sql`` or ``.gz`` extension, depending on whether compression is enabled in the backup configuration. You may also decide to run backups outside the application. You should also have Nginx restrict application access when exposing it to the Internet. Simply generate an htpasswd string `using one of the many generators found online <https://www.transip.nl/htpasswd/>`_. You should be prompted for login credentials the next time your browser accesses the application. For more information regarding this topic, see the `Nginx docs <https://www.nginx.com/resources/admin-guide/restricting-access/>`_. You surely want to ``reboot`` your device and check whether everything comes up automatically again with ``sudo supervisorctl status``. This will make sure your data logger 'survives' any power surges. Project-Id-Version: DSMR Reader v1.x
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
POT-Creation-Date: 
PO-Revision-Date: 
X-Generator: Poedit 1.8.7.1
 :doc:`Deze informatie kun je hier terugvinden<faq>`. Kijk ook af en toe of je nog voldoende schijfruimte hebt. Later zal ik de mogelijkheid toevoegen om oude metingen (niet de dagtotalen) te verwijderen na een X-periode. Als alternatief kun je ook lokaal een ``htpasswd`` bestand genereren, door ``sudo apt-get install apache2-utils`` te installeren en vervolgens het command ``sudo htpasswd -c /etc/nginx/htpasswd USERNAME`` uit te voeren (waarbij ``USERNAME`` je gewenste gebruikersnaam is). En herlaad met:: Applicatie updates (bugfixes & nieuwe mogelijkheden) Inhoudsopgave DSMR 2.x (oude meters) Databehoud & backups Heb je de applicatie geinstalleerd met een monitor aan je RaspberryPi en weet je het IP-adres niet? Typ in dat geval het volgende in en je krijgt het IP-adres te zien: ``ifconfig | grep addr`` Vergeet vooral niet om daarna ``./post-deploy.sh`` uit te voeren (staat in hoogste map van project), die ervoor zorgt dat de hele applicatie zichzelf herlaadt en daarmee de nieuwe instellingen per direct gebruikt. Alles gelukt? Gefeliciteerd! Dit was het lastigste gedeelte en nu kun je eindelijk gebruikmaken van de applicatie en je energieverbruik meten. Voor **MySQL/MariaDB** kun je dit script gebruiken: ``dsmrreader/provisioning/mysql/mysql-backup.sh``. Voor meer informatie om (optioneel) een USB-drive te gebruiken voor backup's, zie `Data preservation/backups #268 <https://github.com/dennissiemensma/dsmr-reader/issues/268>`_. Echter, hiermee staan de gegevens nog steeds **lokaal** op je 'kwestsbare' SD-kaart. Je zult die data dus moeten kopieren naar een locatie buiten je RaspberryPi om. Wanneer je de applicatie koppelt aan het Internet wil je sowieso extra maatregelen nemen: In dit voorbeeld is het IP-adres ``192.168.178.150``. Het is aan te raden om je apparaat een vast IP-adres te geven in je router. Dit zorgt ervoor dat je de applicatie altijd op dezelfde locatie kan terugvinden. Installeer een firewall, zoals ``ufw`` (`UncomplicatedFirewall <https://wiki.ubuntu.com/UncomplicatedFirewall>`_) and beperk al het toegestane verkeer tot poort ``22`` (puur voor jezelf) en poort ``80``. Je kunt een htpassw-generator veilig gebruiken **zolang je maar NOOIT persoonlijke informatie of gegevens invoert die je ook op andere websites gebruikt**! Wanneer je een meter met DSMR 2.x hebt, zul je deze in het beheerderpaneel onder ``dataloggerconfiguratie`` moet instellen. Zorg ervoor dat je de back-ups via een 'daily cronjob' hebt ingepland en test dat door het volgende uit te voeren:  ``run-parts -v /etc/cron.daily``. N.B.: De standaard DSMR-versie die de applicatie gebruikt is DSMR 4.x. Dit is namelijk de **standaardversie** voor nieuwe/recent geplaatste slimme meters. Dit is het moment om de applicatie te bekijken in je browser om te zien of alles naar behoren werkt. Vul het IP-adres van je RaspberryPi in je browser. Zorg ervoor dat je geen typefouten hebt gemaakt door te controleren met:: Open de website's vhost in ``/etc/nginx/sites-enabled/dsmr-webinterface`` en schakel de volgende regels in (verwijder de ## tekens):: Optioneel: Een USB-drive gebruiken voor backup's Plak de htpasswd-tekenreeks in het bestand ``/etc/nginx/htpasswd``. Zorg ervoor dat je ofwel deze feature gebruikt ofwel zelf back-ups maakt en ze regelmatig ergens heen kopieert (zie hieronder). Zorg ervoor dat je de instelling ``SECRET_KEY`` wijzigt in het bestand ``dsmrreader/settings.py``. Waarschuwing voor publiekelijke toegang Herstart-test De SD-kaart is verreweg **de zwakste schakel** in dit geheel and **gaat gegarandeerd kapot** op een dag. De applicatie maakt standaard elke nacht een back-up. Het command vraagt vervolgens om een wachtwoord voor het account. Er zijn voorbeeldscripts voor back-ups beschikbaar in ``dsmrreader/provisioning/postgresql/psql-backup.sh`` voor **PostgreSQL**. Deze gebruik ik zelf om handmatig een back-up te maken naar een USB-stick die aan mijn RaspberryPi hangt. Er is ingebouwde ondersteuning om back-ups naar je  **Dropbox**-account te uploaden. *Zonder dat de applicatie toegang tot je (privé) bestanden in je Dropbox-account heeft*. De applicatie gebruiken Bekijk applicatie Zorg ervoor dat je regelmatig **back-ups maakt**! Het is een veelvoorkomende fout om dat niet te doen en zelf liep ik er ook al vrij snel tegenaan. Gelukkig gebeurde dat vrij vroeg in het traject en was ik 'slechts' een maand aan gegevens kwijt. Stel je voor dat je jaren met historische data kwijtraakt, zou zonde zijn! Je kunt ze terugvinden in de ``backups`` map van de applicatie. Ze zijn te herkennen aan een ``.sql`` of ``.gz`` extensie, afhankelijk de gekozen compressie-instellingen in de back-upconfiguratie. Je kunt er tevens voor kiezen om zelf backups buiten de applicatie om te maken. Je zou in Nginx de toegang moeten beperken door altijd inloggegevens te vragen voor het bekijken van de applicatie. Genereer een zogenaamde htpasswd-tekenreeks via `een van de vele websites die dit voor je kunnen doen <https://www.transip.nl/htpasswd/>`_. Als het goed is krijg je de volgende keer dat je de applicatie bekijkt een pop-up te zien, waarin je gevraagd wordt om in te loggen. Voor meer informatie over dit onderwerp `zie de Nginx documentatie <https://www.nginx.com/resources/admin-guide/restricting-access/>`_. Herstart het apparaat met ``reboot`` om te testen of alles automatisch opstart. Je zou na de herstart alles moeten zien draaien via ``sudo supervisorctl status``. Dit zorgt ervoor dat je datalogger eventuele stroomstoringen overleeft (of wanneer je zelf de stroom eraf haalt). 