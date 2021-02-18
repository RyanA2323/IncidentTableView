//
//  ViewController.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shooterOutlet: UIButton!
    @IBOutlet weak var fightOutlet: UIButton!
    @IBOutlet weak var otherOutlet: UIButton!
    @IBOutlet weak var medicalOutlet: UIButton!
    var incidentMade = Incident(inc: .other)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func fightAction(_ sender: UIButton) {
        incidentMade.type = .fight
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func shooterAction(_ sender: UIButton) {
        incidentMade.type = .shooter
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func medAction(_ sender: UIButton) {
        incidentMade.type = .medical
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func otherAction(_ sender: UIButton) {
        incidentMade.type = .other
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    
    
    //error is in this func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        incidentMade.submit()
        }
    
    
}

