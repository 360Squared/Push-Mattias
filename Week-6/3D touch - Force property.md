# 3D touch - Force property

* **hypothese:**  
De force property die gebruik maakt van 3D touch geeft een betrouwbare meting terug.

* **testopzet:**  
Door middel van de force property te koppelen aan een label en daarin de force weer te geven in een app wil ik testen of deze uitgebreid en betrouwbaar genoeg is om in toepassingen te kunnen implementeren.
 
* **resultaat:**  
Als eerste heb ik naslagwerk gepleegd om te hoe kijken of en hoe het mogelijk is om te kijken hoe hard iemand op zijn scherm drukt tijdens een aanraking. Sinds iPhone 6S en de plus variant is er namelijk 3D touch ingebouwd in het scherm.
 
 Hiervoor heb ik de [UITouch](https://developer.apple.com/documentation/uikit/uitouch) klasse gevonden. Binnen elke UIview zijn er functie die worden aangeroepen zodra iemand een aanraking uitvoert.
 
 Voor dit onderzoek heb ik de volgende twee functie overschreven in de view controller: 
 
 ```Swift
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch: UITouch = touches.first as! UITouch
        
        forceLabel.text = "\(touch.force)"
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        forceLabel.text = "0.0"
    }
 ```
 
 De touchesMoved wordt aangeroepen zodra iemand zijn vinger verplaatst op het scherm. Binnen het object geef de touch.force een NSFloat terug. Na testen ben ik erachter gekomen dat deze waarden tussen 0.0 en 6.6666666 op zowel mijn iPhone 6s en iPad 2 liggen.
 
 Echter zijn de waarden daartussen niet volledig responsief. Daardoor zou je wellicht deze techniek ideaal kunnen gebruiken om lijnen te kunnen zetten maar voor echt aanraakgevoelige oplossingen die een hoge nauwkeurigheid vereisen is deze techniek niet afdoende.