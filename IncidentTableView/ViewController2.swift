//
//  ViewController2.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var incidents: [Incident] = []
    var selectedIncident: Incident!
    var btnType: typeIncident = .other
    
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
                    
                    var returnType = String()
                    for dt in document.data() {
                        if dt.key == "type" {
                            returnType = dt.value as! String
                        }
                    }
                    
                    switch returnType {
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
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        selectedIncident = incidents[indexPath.row]
        btnType = selectedIncident.type
        performSegue(withIdentifier: "toVC3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController3
        nvc.info.append("Location: \(selectedIncident.location ?? "Unknown")\n Level: \(selectedIncident.level ?? .low)" )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        
        switch incidents[indexPath.row].type {
        case .shooter: cell.configure(pic: UIImage(named: "activeShooter")!, incident: incidents[indexPath.row].type)
        case .fight: cell.configure(pic: UIImage(named: "fist")!, incident: incidents[indexPath.row].type)
        case .medical: cell.configure(pic: UIImage(named: "starOfLife")!, incident: incidents[indexPath.row].type)
        case .other: cell.configure(pic: UIImage(named: "weirdPerson")!, incident: incidents[indexPath.row].type)
        }
        
        return cell
    }
    

   
}

