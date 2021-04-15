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
    var incident : String!
    
    var defaults = UserDefaults.standard
    let db = Firestore.firestore()
    var incidentListener: ListenerRegistration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    @IBAction func unwindVC2(_ seg: UIStoryboardSegue ) {
        print("unwinding")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startListen()
    }
    
    func startListen() {
        incidentListener = db.collection("incidents").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                self.incidents = []
                
                for document in querySnapshot!.documents {
                    
                    let incidentMade = Incident(inc: .other)
                    incidentMade.key = document.documentID
                    
                    var returnType = String()
                    for dt in document.data() {
                        if dt.key == "type" {
                            returnType = dt.value as! String
                        }
                        if dt.key == "time" {
                            incidentMade.timeCreated = dt.value as? Timestamp
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MM/dd HH:mm"
                            
                            let convertTime = formatter.string(from: incidentMade.timeCreated!.dateValue())
                            
                            incidentMade.timeDisplay = convertTime
                        }
                    }
                    
                    switch returnType {
                    case "Fight":
                        incidentMade.type = .fight
                    case "Medical":
                        incidentMade.type = .medical
                    case "Shooter":
                        incidentMade.type = .shooter
                    case "Other":
                        incidentMade.type = .other
                    default:
                        incidentMade.type = .shooter
                    }
                    
                    let dateCompare = Date(timeIntervalSinceNow: -604800)
                    let timeCompare = Timestamp(date: dateCompare)
                    
                    if (incidentMade.timeCreated!.dateValue() > timeCompare.dateValue()) {
                        self.incidents.append(incidentMade)
                    }
                }
            }
            print(self.incidents.count)
            
            self.incidents.sort(by: {$0.timeCreated!.dateValue() > $1.timeCreated!.dateValue()} )
            self.tableview.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        incidentListener.remove()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaults.setValue(incidents[indexPath.row].key, forKey: "currentIncidentKey")
        incident = "\(incidents[indexPath.row].type)"
        performSegue(withIdentifier: "toVC3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController3
        nvc.incType = incident
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            incidents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        
        switch incidents[indexPath.row].type {
        case .shooter: cell.configure(pic: UIImage(named: "weirdPersonRed")!, incidentType: incidents[indexPath.row].type, timeDisplay: incidents[indexPath.row].timeDisplay ?? "null")
        case .fight: cell.configure(pic: UIImage(named: "squareFistOrange")!, incidentType: incidents[indexPath.row].type, timeDisplay: incidents[indexPath.row].timeDisplay ?? "null")
        case .medical: cell.configure(pic: UIImage(named: "medicalPink")!, incidentType: incidents[indexPath.row].type, timeDisplay: incidents[indexPath.row].timeDisplay ?? "null")
        case .other: cell.configure(pic: UIImage(named: "qMark")!, incidentType: incidents[indexPath.row].type, timeDisplay: incidents[indexPath.row].timeDisplay ?? "null")
        }
        
        return cell
    }
}

