//
//  ViewController2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var incidents: [Incident] = []
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        db.collection("incidents").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // print("\(document.documentID) => \(document.data())")
                    
                    let incidentMade = Incident(inc: .other)
                    incidentMade.key = document.documentID
                    
                    var returnList = [String]()
                    for dt in document.data() {
                        returnList.append(dt.value as! String)
                    }
                    
                    switch returnList[1] {
                    case "Fight":
                        incidentMade.type = .fight
                    // print("changed to fight")
                    case "Medical":
                        incidentMade.type = .medical
                    case "Shooter":
                        incidentMade.type = .shooter
                    case "Other":
                        incidentMade.type = .other
                    // print("changed to other")
                    default:
                        incidentMade.type = .shooter
                    // print("default")
                    }
                    
                    // print(returnList)
                    
                    self.incidents.append(incidentMade)
                }
            }
            // print(self.incidents.count)
            self.tableview.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        
        switch incidents[indexPath.row].type {
        case .shooter: cell.configure(pic: UIImage(named: "activeShooter")!, incident: incidents[indexPath.row].type.rawValue)
        case .fight: cell.configure(pic: UIImage(named: "fist")!, incident: incidents[indexPath.row].type.rawValue)
        case .medical: cell.configure(pic: UIImage(named: "starOfLife")!, incident: incidents[indexPath.row].type.rawValue)
        case .other: cell.configure(pic: UIImage(named: "weirdPerson")!, incident: incidents[indexPath.row].type.rawValue)
        }
        
        //        if incidents[indexPath.row].type == .shooter {
        //            cell.configure(pic: UIImage(named: "activeShooter")!, incident: incidents[indexPath.row].type.rawValue)
        //        } else if incidents[indexPath.row].type == .fight {
        //            cell.configure(pic: UIImage(named: "fist")!, incident: incidents[indexPath.row].type.rawValue)
        //        } else if incidents[indexPath.row].type == .medical {
        //            cell.configure(pic: UIImage(named: "starOfLife")!, incident: incidents[indexPath.row].type.rawValue)
        //        } else {
        //            cell.configure(pic: UIImage(named: "weirdPerson")!, incident: incidents[indexPath.row].type.rawValue)
        //        }
        
        return cell
    }
    
    
    
}
