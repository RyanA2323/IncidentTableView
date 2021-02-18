//
//  ViewController3.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/26/21.
//

import UIKit
import Firebase

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var textfieldOutlet: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var ind: IndexPath!
    var tableList: [Incident] = []
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableList = []
        
        db.collection("incidents").document(Core.currentIncidentKey ?? "DemoIncident").collection("subInformation").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // print("\(document.documentID) => \(document.data())")
                    
                    let incidentMade = Incident(inc: .other)
                    incidentMade.key = document.documentID
                    
                    var returnInfo: String
                    for dt in document.data() {
                        if dt.key == "info" {
                            returnInfo = dt.value as! String
                            incidentMade.info = returnInfo
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
    
    
    //    @IBAction func addAction(_ sender: UIBarButtonItem) {
    //        var check : Bool = false
    //        for item in info {
    //            if(textfieldOutlet.text == item){
    //                check = true
    //            }
    //        }
    //        if (check){
    //            alert()
    //        }
    //        else{
    //            info.append(textfieldOutlet.text!)
    //            tableview.reloadData()
    //            textfieldOutlet.text = ""
    //        }
    //
    //    }
    
    
    //    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    //        ind = indexPath
    //    }
    
    //    @IBAction func editAction(_ sender: UIBarButtonItem) {
    //        tableview.cellForRow(at: ind)?.textLabel?.text = textfieldOutlet.text!
    //        info[ind.row] = textfieldOutlet.text!
    //        textfieldOutlet.text = ""
    //    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "myCell")!
        
        cell.textLabel?.text = tableList[indexPath.row].info
        cell.textLabel?.numberOfLines = 2
        
        cell.detailTextLabel?.text = tableList[indexPath.row].timeCreated as? String
        cell.detailTextLabel?.textColor = UIColor.gray
        
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
}
