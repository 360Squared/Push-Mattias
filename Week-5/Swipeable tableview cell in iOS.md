# Swipeable tableview cell in iOS

* **hypothese:**  
Kan ik een tableview cell uitbreiden met eigen acties zoals delete en meer?

* **testopzet:**  
Door middel van een gemockte tableview wil ik acties toevoegen aan een cell met verschillende acties. 
 
* **resultaat:**  
Als startpunt ben ik begonnen met zoeken op het internet hoe ik dit moet aanpakken. Uiteindelijk ben ik op [deze tutorial](https://www.raywenderlich.com/62435/make-swipeable-table-view-cell-actions-without-going-nuts-scroll-views) uitgekomen. Helaas is deze tutorial not met Objective-C. Echter is in de comments door de auteur "UITableViewRowAction" genoemd. Na het zoeken op deze term ben ik uiteindelijk op [deze post](http://swiftdeveloperblog.com/uitableviewrowaction-example-in-swift/) uitgekomen.

  Ik ben vervolgens een standaard tableview gaan maken. De tableview wordt gevuld met een simpele string array met Item one, two en three.
  
  Om eigen acties toe te voegen hoeft er eigenlijk niet veel extra's te gebeuren. Vanuit de tutorial is gebleken dat de TableViewDelegate een functie beschikbaar is die het toevoegen van acties gemakkelijk maakt. De geimplementeerde functie ziet er als volgt uit:
  
  ``` Swift
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let shareAction  = UITableViewRowAction(style: .normal, title: "Share") { (rowAction, indexPath) in
            print("Share Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
        }
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
            print("Delete Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
        }
        shareAction.backgroundColor = UIColor.green
        return [shareAction,deleteAction]
    }
  ```
  
  Bij naslag in [de documentatie van Apple](https://developer.apple.com/documentation/uikit/uitableviewrowaction) wordt het wel duidelijk dat dit een apparte klasse is die niet terug valt op bijvoorbeeld een UIButton. Dat maakt het dus afgezien van de kleuren aanpassen, wat beperkter.