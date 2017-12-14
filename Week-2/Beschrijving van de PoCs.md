# Beschrijving van de PoC's


Geef een beschrijving van de test die je gedaan hebt met elk Proof of Concept. Voeg 
 de code ook toe in de map **code**.
 
### Push/lokale notificaties

* **hypothese:**  
Kan er binnen iOS eenvoudig gebruik gemaakt worden van het vernieuwe notificatie framework?

* **testopzet:**  
Door mijzelf goed in te lezen in het onderwerp en tutorials en frameworks te zoeken een klein proof of concept op te stellen waarmee dit concept getest kan worden.
Door een aantal tuturials te volgen en deze uit te werken tot een poc dat een lokale notificatie kan simuleren.
 
* **resultaat:**  
Binnen iOS 10 is er voor besloten om de oudere manier van afhandeling van notificatie te veranderen. Omdat ik enkel met het oude framework heb gewerkt vond ik het goed om het nieuwe framework te proberen. Hieruit is gebleken dat de functie die normaal in de AppDelegate terecht komen nu afgevangen worden door een notificatiemanager class. Dit werkte in mijn optiek makkelijker en beter omdat code nu beter geisoleerd kan worden. Het resultaat is terug te zien in het PoC van dit concept.

### Social Share iOS

* **hypothese:**  
Hoe kan informatie makkelijk en gestandaardiseerd gedeeld worden vanuit een app naar andere social media?

* **testopzet:**  
Door mijzelf goed in te lezen in het onderwerp en tutorials en frameworks te zoeken een klein proof of concept op te stellen waarmee dit concept getest kan worden.
Door een aantal tuturials te volgen en deze uit te werken tot een poc dat een zelf ingetypte tekst kan delen naar andere beschikbare apps en social media op de telefoon met gebruik van het social Framework.
* **resultaat:**  
In het proof of concept is er een formulier gebouwd die het delen van teksten en eventueel foto's makkelijk en snel laat doen via de native share functie van iOS. Het probleem is dat hiervoor het Social Framework deprecated is en dat deze functionaliteit op een andere manier wordt aangeroepen. Hoe dit is gedaan is te zien binnen het PoC.