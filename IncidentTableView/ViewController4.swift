//
//  ViewController4.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit
import Firebase

class ViewController4: UIViewController {
    
    @IBOutlet weak var infoTextField: UITextView!
    @IBOutlet weak var roomNumberField: UITextField!
    
    let currentIncidentKey = Core.currentIncidentKey
    var locationToSubmit: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (roomNumberField.text == "") {
            locationToSubmit = Core.currentInfoLocation ?? "No Location Specified."
        }
        else {
            locationToSubmit = roomNumberField.text
        }
    }
    
    
    @IBAction func reportAction(_ sender: UIButton) {
        submitSubInfo(doc: currentIncidentKey ?? "DemoIncident", info: infoTextField.text, locationSubmit: locationToSubmit ?? "No Location Specified.")
    }
    
    @IBAction func mapScreenAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toFloor1", sender: nil)
    }
    
    @IBAction func unwind2(_ seg: UIStoryboardSegue ) {
        print("unwinding to screen 4")
    }
    
    func submitSubInfo(doc: String, info: String, locationSubmit: String){
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").document(doc).collection("subInformation").addDocument(data: [
            "info": info,
            "location": locationSubmit
        ] ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
}
