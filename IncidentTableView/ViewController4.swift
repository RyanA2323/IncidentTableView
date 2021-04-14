//
//  ViewController4.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit
import Firebase

class ViewController4: UIViewController {
    
    @IBOutlet weak var reportBtnLabel: UIButton!
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var report2: UIButton!
    @IBOutlet weak var report1: UIButton!
    
    var currentIncidentKey: String = "DemoIncident"
    var currentIncidentKeyTemp = ""
    static var fromAddInfo: Bool = false
    var locationToSubmit: String?
    var defaults = UserDefaults.standard
    let alert = UIAlertController(title: "Submitted!", message: "Would You Like To Add Additional Information?", preferredStyle: .alert)
    
    var pointX: CGFloat?
    var pointY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (ViewController4.fromAddInfo == true) {
            report2.isHidden = true
        } else{
            report1.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let sesh = defaults.object(forKey: "currentIncidentKey") as? String {
            currentIncidentKeyTemp = sesh
        }
        
        if currentIncidentKey == currentIncidentKeyTemp {
            print("Incident Key Did Not Change!")
        }
        
        currentIncidentKey = currentIncidentKeyTemp
    }
    
    @IBAction func reportAction(_ sender: UIButton) {
        submitSubInfo(doc: currentIncidentKey, info: infoTextField.text, x: pointX ?? 0.0, y: pointY ?? 0.0)
        performSegue(withIdentifier: "unwindVC3", sender: nil)
    }
    
    @IBAction func mapScreenAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toFloor1", sender: nil)
    }
    
    @IBAction func unwindVC4(_ seg: UIStoryboardSegue ) {
        print("unwinding to screen 4")
    }
    
    func submitSubInfo(doc: String, info: String, x: CGFloat, y: CGFloat){
        var ref: DocumentReference? = nil
        ref = db.collection("incidents").document(doc).collection("subInformation").addDocument(data: [
            "info": info,
            "pointx": x,
            "pointy": y,
            "time": Timestamp()
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
    }
    
    func unhide() {
        infoTextField.isHidden = false
        reportBtnLabel.isHidden = false
        enterLabel.isHidden = false
        topLabel.isHidden = false
    }
}
