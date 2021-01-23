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
    var btnType: typeIncident!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fightAction(_ sender: UIButton) {
        btnType = .fight
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func shooterAction(_ sender: UIButton) {
        btnType = .shooter
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func medAction(_ sender: UIButton) {
        btnType = .medical
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    @IBAction func otherAction(_ sender: UIButton) {
        btnType = .other
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    
    
    //error is in this func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController2
        nvc.incidents.append(Incident(inc: btnType))
        nvc.btnType = self.btnType
        }
    
    
}

