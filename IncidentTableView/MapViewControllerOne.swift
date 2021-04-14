//
//  MapViewControllerOne.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class MapViewControllerOne: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var gestures: UITapGestureRecognizer!
    var runTimesCheck = 0
    var from4Btns: Bool = false
    let alert = UIAlertController(title: "Check", message: "Are Your Sure You Want To Submit?", preferredStyle: .alert)
    let alert2 = UIAlertController(title: "Successfully Submitted!", message: "Would You Like To Add Additional Informaion?", preferredStyle: .alert)
    let yesAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
    let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
    
    var currentIncident = Incident(inc: typeIncident.other)
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad();
        image.addGestureRecognizer(gestures);
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func unwindVC5(_ seg: UIStoryboardSegue ) {
        print("unwinding to first floor")
    }
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer) {
        print("hello")
        let recog = sender
        let pos = recog.location(in: image);
        let location = Location(pos: normalize(pos), floor: Int.random(in: 0...1));
        // Give to incident class or smthn instead of print
        
        currentIncident.pointx = location.pos.x
        currentIncident.pointy = location.pos.y
        
        //-------------------------------------
        
        if from4Btns == true {
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
                
                self.defaults.setValue(location.pos.x, forKey: "defaultsX")
                self.defaults.setValue(location.pos.y, forKey: "defaultsY")
                
                self.currentIncident.submit()
                self.runAlert2()
            })
            let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
                // Unwind back to the button screen
            })
            if runTimesCheck == 0 {
                alert.addAction(noAction)
                alert.addAction(yesAction)
            }
            present(alert, animated: true, completion: nil)
            print("presented")
            runTimesCheck += 1
        } else {
            defaults.setValue(location.pos.x, forKey: "defaultsX")
            defaults.setValue(location.pos.y, forKey: "defaultsY")
            
            performSegue(withIdentifier: "unwindVC4", sender: nil)
        }
        
        
    }
    func normalize(_ location: CGPoint) -> CGPoint {
        let frameSize = image.frame.size;
        let imageSize = image.image!.size;
        let shrinkx = imageSize.width/frameSize.width;
        let shrinky = imageSize.height/frameSize.height;
        var floint: CGPoint;
        if(shrinkx > shrinky) {
            let heightInFrame = imageSize.height/shrinkx;
            let offY = (frameSize.height - heightInFrame) / 2;
            let newY = location.y - offY;
            floint = CGPoint(x: location.x / frameSize.width, y: newY / heightInFrame);
        } else {
            let widthInFrame = imageSize.width/shrinky;
            let offX = (frameSize.width - widthInFrame) / 2;
            let newX = location.x - offX;
            floint = CGPoint(x: newX / widthInFrame, y: location.y / frameSize.height);
        }
        return floint;
    }
    
    func runAlert2() {
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            //code
            ViewController4.fromAddInfo = false
            self.performSegue(withIdentifier: "toVC4fromVC5", sender: nil)
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            //code
            
            self.performSegue(withIdentifier: "unwindVC2", sender: nil)
        })
        alert2.addAction(noAction)
        alert2.addAction(yesAction)
        present(alert2, animated: true, completion: nil)
    }
}
