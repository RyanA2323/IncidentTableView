//
//  ViewController3.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/26/21.
//

import UIKit
import Firebase

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var ind: IndexPath!
    var tableList: [Incident] = []
    var defaults = UserDefaults.standard
    var currentIncidentKey = "DemoIncident"
    
    var incType: String = ""
    var clickedIncident = Incident(inc: .other)
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      titleOutlet.text = "Additional Information \n Incident: \(incType)"
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableList = []
        
        if let sesh = defaults.object(forKey: "currentIncidentKey") as? String {
            currentIncidentKey = sesh
            print(currentIncidentKey)
        }
        
        db.collection("incidents").document(currentIncidentKey).collection("subInformation").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // print("\(document.documentID) => \(document.data())")
                    
                    let incidentMade = Incident(inc: .other)
                    incidentMade.key = document.documentID
                    
                    var returnInfo = ""
                    for dt in document.data() {
                        if dt.key == "info" {
                            returnInfo = dt.value as? String ?? "Info receive error."
                            incidentMade.info = returnInfo
                        }
                        if dt.key == "location" {
                           incidentMade.location = dt.value as? String ?? "Location receive error."
                        }
                        if dt.key == "time" {
                            incidentMade.timeCreated = dt.value as? Timestamp
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = "HH:mm"

                            let convertTime = formatter.string(from: incidentMade.timeCreated!.dateValue())

                            incidentMade.timeDisplay = convertTime
                        }
                    }
                    
                    // print(returnList)
                    
                    self.tableList.append(incidentMade)
                }
            }
            // print(self.tableList.count)
            self.tableview.reloadData()
        }
    }
    
    func alert() {
        
        let alert = UIAlertController(title: "Oops!", message: "Looks like you already have this item.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell2
        
        //incident.location & incident.info for the parameters 
        cell.configure(loc: tableList[indexPath.row].location ?? "No location specified.", addInfo: tableList[indexPath.row].info ?? "No info to display.")
        
       // print(tableList[indexPath.row].location ?? "no")
       // print(tableList[indexPath.row].info ?? "no info")
        
        return cell
    }
    
}
