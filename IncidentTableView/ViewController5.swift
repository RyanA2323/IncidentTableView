//
//  ViewController5.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 2/16/21.
//

import UIKit

class ViewController5: UIViewController {

    var location: String = ""
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var cafeBtn: UIButton!
    @IBOutlet weak var firstFloorImage: UIImageView!
    @IBOutlet weak var mainGymBtn: UIButton!
    @IBOutlet weak var auxGymBtn: UIButton!
  //  var incident = Incident()
    var runTimesCheck = 0
    let alert = UIAlertController(title: "", message: "Are Your Sure You Want To Submit?", preferredStyle: .alert)
    let alert2 = UIAlertController(title: "Successfully Submitted!", message: "Would You Like To Add Additional Informaion?", preferredStyle: .alert)
    let yesAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
    let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainGymAction(_ sender: UIButton) {
        defaults.setValue("Main Gym", forKey: "currentInfoLocation")
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            //code
            self.runAlert2()
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            //code
        })
        if runTimesCheck == 0 {
        alert.addAction(noAction)
        alert.addAction(yesAction)
        }
        present(alert, animated: true, completion: nil)
        print("presented")
        runTimesCheck += 1
    }
    
    @IBAction func auxGymAction(_ sender: UIButton) {
        defaults.setValue("Aux Gym", forKey: "currentInfoLocation")
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            //code
            self.runAlert2()
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            //code
        })
        if runTimesCheck == 0 {
        alert.addAction(noAction)
        alert.addAction(yesAction)
        }
        present(alert, animated: true, completion: nil)
        print("presented")
        runTimesCheck += 1
    }
    
    @IBAction func cafeAction(_ sender: UIButton) {
        defaults.setValue("Cafe", forKey: "currentInfoLocation")
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            //code
            self.runAlert2()
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            //code
        })
        if runTimesCheck == 0 {
        alert.addAction(noAction)
        alert.addAction(yesAction)
      
        }
        present(alert, animated: true, completion: nil)
        print("presented")
        runTimesCheck += 1
    }
    
    @IBAction func unwind3(_ seg: UIStoryboardSegue ) {
        print("unwinding to first floor")
    }
    
    
    func runAlert2() {
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            //code
            self.performSegue(withIdentifier: "toVC4fromVC5", sender: nil)
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            //code
            
        })
        alert2.addAction(yesAction)
        alert2.addAction(noAction)
        present(alert2, animated: true, completion: nil)
    }
    
}
