# SiriKit (iOS)

* **hypothese:**  
Kan er binnen een app gemakkelijk Siri functionaliteiten toegevoegd worden?

* **testopzet:**  
Door middel van Apple's developer website en code voorbeelden wil ik Siri implementeren en de gevonden stappen documenteren. 
 
* **resultaat:**  
Als startpunt ben ik begonnen op de Apple Developer website. Hierop heb ik geklikt naar de documentatie over SiriKit (<https://developer.apple.com/sirikit/>). Binnen deze website zijn er diverse guides beschikbaar. Ook heb ik nog een externe tutorial bekeken omdat Apple io sommige punten nog onduidelijk was. Deze tutorial heb ik [hier](https://medium.com/ios-os-x-development/extending-your-ios-app-with-sirikit-fd1a7ef12ba6) gevonden. Dit is het stappenplan wat ik heb uitgevoerd om een app met siri implementatie voor de messages app werkend te krijgen:

1. Ik heb als eerste een nieuw xcode project aangemaakt op basis van het single view template.  
1. Vervolgens heb ik in de build capabilities van het project SiriKit aangezet.  

1. Om vervolgens functionaliteit vanuit de app toe te voegen aan Siri moet er een koppeling komen. Binnen Siri wordt hiervoor gebruikt van een intents extension. Deze extensie kan in het project toegevoegd door op File -> New -> Target te klikken. In het opkomende scherm kan er voor Intents Extension gekozen worden. Er is ook een zogenaamde Intents UI Extension beschikbaar, echter wordt deze alleen gemaakt wanneer je Custom UI wilt toevoegen aan de Siri interface.
1. Vervolgens kies je een naam voor de extension. Zelf heb ik voor sendMessageExtension gekozen.  

  Standaard maakt XCode nu een extension van het messages domain aan. En hier is dus een eventuele restrictie waargenomen aan Siri. Om mogelijke commando's te kunnen gebruiken heeft Apple domeinen opgesteld. Een van deze domeinen moet gekozen worden en dit domein maakt dan ook aan Siri duidelijk welke commando's Siri kan verwachten. Deze lijst is bij Intent Domains (<https://developer.apple.com/documentation/sirikit>) te vinden met daarbij omschrijvingen en functionaliteiten.
  
1. Binnen de extension zijn nu de minimaal vereiste functies geimplementeerd zoals deze bij de [messaging documentatie](https://developer.apple.com/documentation/sirikit/messaging) te vinden zijn. Deze functies zijn INSendMessageIntentHandling, INSearchForMessagesIntentHandling, INSetMessageAttributeIntentHandling

  ook wordt er een standaard functie geimplementeerd:  

  ```swift
func handle(intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Void) {
    // Implement your application logic to send a message here.
    
    let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent.self))
    let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
    completion(response)
}
```

  In deze functie kunnen verder aditionele acties geimplementeerd worden.

* **Conclusie:**   
Aan de hand wat ik heb onderzocht moet ik zeggen dat Siri makkelijk is te implementeren. Echter zitten er beperkingen aan. Zo kun je niet volledig vrij woorden kiezen maar je moet functionaliteit inbouwen aan de hand van voorgekozen domeinen. Dat maakt het toch beperkt in gebruik voor in een app.
