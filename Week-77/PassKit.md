# PassKit (iOS)

* **hypothese:**  
Kan er gemakkelijk een pass aangemaakt worden voor de wallet app op de iPhone?

* **testopzet:**  
Door middel van Apple's developer website en code voorbeelden wil ik een werkende pass maken en toevoegen aan de Wallet App. 
 
* **resultaat:**  
Als startpunt ben ik begonnen op de Apple Developer website. Hierop heb ik geklikt naar de documentatie over Wallet (<https://developer.apple.com/wallet/>). Binnen de Wallet subsite heb ik [deze](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/PassKit_PG/YourFirst.html#//apple_ref/doc/uid/TP40012195-CH2-SW1) tutorial gevonden en heb ik hiermee de app gemaakt die is bijgevoegd in deze folder.

  De bevindingen die ik heb gevonden zijn als volgt:  
  * Een pass kan makkelijk opgesteld door middel van een json bestand waarin de inhoud van de pass beschreven staat.
  * Een pass is zeker veilig. Passes moeten worden gesigneerd met een bundle id en een actief team id. Dit betekent ook dat er dus betaald moet worden voor een Developer Program.
  * Voor het signeren is gebruik gemaakt van het programma dat is meegeleverd in de voorbeelden. signpass genaamd. Een simpel zoek resultaat geeft ook aan dat er diverse libraries voor onder andere PHP en Node.JS beschikbaar zijn om dit in een web applicatie te implementeren.
  * Doordat er verschillende pass types beschikbaar zijn kunnen onder andere vouchers en tickets makkelijk gegenereerd worden.
