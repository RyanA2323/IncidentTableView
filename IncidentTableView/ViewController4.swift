//
//  ViewController4.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit
import Firebase

class ViewController4: UIViewController {
    
    @IBOutlet weak var submittedLabel: UILabel!
    @IBOutlet weak var reportBtnLabel: UIButton!
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var roomNumberField: UITextField!
    
    var currentIncidentKey: String = "DemoIncident"
    var currentIncidentKeyTemp = ""
    static var fromAddInfo: Bool = false
    var locationToSubmit: String?
    var defaults = UserDefaults.standard
    let alert = UIAlertController(title: "Submitted!", message: "Would You Like To Add Additional Information?", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
//            //code
//            self.unhide()
//        })
//        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
//            //code
//            self.performSegue(withIdentifier: "toIncidentList", sender: nil)
//        })
//        alert.addAction(yesAction)
//        alert.addAction(noAction)
//        present(alert, animated: true, completion: nil)
//        print("presented")
        
        if let sesh = defaults.object(forKey: "currentIncidentKey") as? String {
            currentIncidentKeyTemp = sesh
        }
        
        if currentIncidentKey == currentIncidentKeyTemp {
            print("Incident Key Did Not Change!")
        }
        
        currentIncidentKey = currentIncidentKeyTemp
    }
    
    @IBAction func reportAction(_ sender: UIButton) {
        
        guard let text = roomNumberField.text, !text.isEmpty else {
            
            if let sesh = defaults.object(forKey: "currentInfoLocation") as? String {
                locationToSubmit = sesh
                print(locationToSubmit ?? "UserDefaults Location Error")
            }
            
            submitSubInfo(doc: currentIncidentKey, info: infoTextField.text, locationSubmit: locationToSubmit ?? "No Location Specified.")
            
            return
        }
        
        locationToSubmit = "Room \(roomNumberField.text ?? "Room # Error")"
        submitSubInfo(doc: currentIncidentKey, info: infoTextField.text, locationSubmit: locationToSubmit ?? "No Location Specified.")
    }
    
    @IBAction func mapScreenAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toFloor1", sender: nil)
    }
    
    @IBAction func unwindVC4(_ seg: UIStoryboardSegue ) {
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
    
    func hide() {
        infoTextField.isHidden = true
        reportBtnLabel.isHidden = true
        enterLabel.isHidden = true
        topLabel.isHidden = true
        submittedLabel.isHidden = false
    }
    
    func unhide() {
        infoTextField.isHidden = false
        reportBtnLabel.isHidden = false
        enterLabel.isHidden = false
        topLabel.isHidden = false
        submittedLabel.isHidden = true
    }
    
    
}
