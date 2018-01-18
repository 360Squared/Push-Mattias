# 3D touch - homescreen shortcuts

* **hypothese:**  
Hoe eenvoudig is het om 3D touch shortcuts te implementeren op het homescreen

* **testopzet:**  
Voor deze Proof of Concept heb ik er voor gekozen om voorbeeld code van Apple te bekijken en te documenteren. Dit omdat de implementatie zelf makkelijk lijkt te zijn. [Apple's codevoorbeeld](https://developer.apple.com/library/content/samplecode/ApplicationShortcuts/Introduction/Intro.html#//apple_ref/doc/uid/TP40016545)
 
* **resultaat:**  
Binnen het code voorbeeld heeft Apple twee story boards opgesteld. Namelijk de LaunchScreen en de Main. Deze staan in de Base map, samen met een string info bestand waarin de titels en omschrijving staan van twee statische shortcuts.

  Uit mijn onderzoek in de code is het namelijk mogelijk om zowel statisch als dynamisch shortcuts te definieren. De statische shortcuts worden gedefinieerd in de app's info.plist.
Dynamische shortcuts zijn alle shortcuts die in de code worden toegevoegd.

  Het toevoegen van dynamische shortcuts is gemakkelijk. Binnen de UIApplication instantie van de applicatie is een property genaamd shortcutItems beschikbaar welke de **dynamische** shortcuts representeert. Wanneer de lijst met shortcuts aangepast moet worden kan dit door deze array te manipuleren en te overschrijven.

  Binnen het codevoorbeeld van Apple wordt er tijdens het opstarten twee dynamische shortcuts toegevoegd. Dit gebeurd in de App delegate en ziet er als volgt uit:  
  
  ```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var shouldPerformAdditionalDelegateHandling = true

        // If a shortcut was launched, display its information and take the appropriate action.
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            
            launchedShortcutItem = shortcutItem
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = false
        }

        // Install initial versions of our two extra dynamic shortcuts.
        if let shortcutItems = application.shortcutItems, shortcutItems.isEmpty {
			// Construct dynamic short item #3
            let shortcut3UserInfo = [AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue]
			let shortcut3 = UIMutableApplicationShortcutItem(type: ShortcutIdentifier.third.type,
															 localizedTitle: "Play",
															 localizedSubtitle: "Will Play an item",
															 icon: UIApplicationShortcutIcon(type: .play),
															 userInfo: shortcut3UserInfo)
			// Construct dynamic short #4
			let shortcut4UserInfo = [AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.pause.rawValue]
			let shortcut4 = UIMutableApplicationShortcutItem(type: ShortcutIdentifier.fourth.type,
															 localizedTitle: "Pause",
															 localizedSubtitle: "Will Pause an item",
															 icon: UIApplicationShortcutIcon(type: .pause),
															 userInfo: shortcut4UserInfo)
            
            // Update the application providing the initial 'dynamic' shortcut items.
            application.shortcutItems = [shortcut3, shortcut4]
        }
        
        return shouldPerformAdditionalDelegateHandling
    }
```  
  Zoals je ziet wordt hier ook gelijk vastgelegd of de app al aangeroepen wordt door een statische shortcut. Echter wordt er altijd nog een functie aangeroepen bij het (opnieuw) openen van de app of shortcut. Het is gebruik om hier dan ook de eventuele verdere shortcut acties af te handelen.  
  
  binnen Apple's codevoorbeeld ziet dat er als volgt uit:  
  
  ```Swift
  func applicationDidBecomeActive(_ application: UIApplication) {
        guard let shortcut = launchedShortcutItem else { return }
        _ = handleShortCutItem(shortcut)

		// Reset which shortcut was chosen for next time.
        launchedShortcutItem = nil
    }
    ```
    
    Waarna er in handleShortCutItem een switch kan plaatsvinden of mogelijke acties geprogrammeerd kunnen worden om de betreffende shortcut af te handelen.
    
    Zoals je ziet is de techniek makkelijk te implementeren. Gezien de techniek 3d Touch vanaf iPhone 6s wordt ondersteund kan het ook al door een breed publiek gebruikt worden.