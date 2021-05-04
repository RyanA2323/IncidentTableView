//
//  MapViewControllerOne.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class MapViewControllerOne: UIViewController {
    @IBOutlet var image: IncidentLocationView!
    @IBOutlet var gestures: UITapGestureRecognizer!
    var runTimesCheck = 0
    var from4Btns: Bool = false
    let alert2 = UIAlertController(title: "Successfully Submitted!", message: "Would You Like To Add Additional Informaion?", preferredStyle: .alert)
    let yesAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
    let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
    var location: String = ""
    var currentIncident = Incident(inc: typeIncident.other)
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad();
        image.addGestureRecognizer(gestures);
        image.setFloorImages([UIImage(named: "Floor1")!, UIImage(named: "floor2")!]);
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func unwindVC5(_ seg: UIStoryboardSegue ) {
        print("unwinding to first floor")
    }
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer) {
        let recog = sender
        let pos = recog.location(in: image);
        let location = Location(pos: normalize(pos), floor: 1);
        
        currentIncident.pointx = location.pos.x
        currentIncident.pointy = location.pos.y
        print(location.pos.x)
        print(location.pos.y)
        image.setLocation(location);
        
        let dotLocation: String = pointToRoom(x: location.pos.x, y: location.pos.y)
        let alert = UIAlertController(title: "Submit?", message: "Location: \(self.location)", preferredStyle: .alert)
        //-------------------------------------
        
        if from4Btns == true {
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (_) in
                
                self.defaults.setValue(location.pos.x, forKey: "defaultsX")
                self.defaults.setValue(location.pos.y, forKey: "defaultsY")
                self.defaults.setValue(dotLocation, forKey: "locationName")
              //  print("NAME: \(self.defaults.string(forKey: "locationName"))")
                self.defaults.setValue(true, forKey: "fromFirstReport")
                
                self.currentIncident.submit()
                self.runAlert2()
            })
            let noAction = UIAlertAction(title: "No", style: .default, handler: { (_) in
            
            })
          //  if runTimesCheck == 0 {
                alert.addAction(noAction)
                alert.addAction(yesAction)
           // }
            present(alert, animated: true, completion: nil)
            print("presented")
            runTimesCheck += 1
        } else {
            defaults.setValue(location.pos.x, forKey: "defaultsX")
            defaults.setValue(location.pos.y, forKey: "defaultsY")
            self.defaults.setValue(dotLocation, forKey: "locationName")
        
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
               self.performSegue(withIdentifier: "unwindVC4", sender: nil)
            }
            
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
    
    func pointToRoom(x: CGFloat, y: CGFloat) -> String {
        location = ""
        let xDouble = Double(x)
        let yDouble = Double(y)

        if (xDouble >= 0.6 && xDouble <= 0.88 && yDouble >= 0.1 && yDouble <= 0.4) {
            location = "Main Gym"
            } else
        if (xDouble >= 0.635 && xDouble <= 0.88 && yDouble >= 0.46 && yDouble <= 0.6) {
            location = "Aux Gym"
            } else
        if (xDouble >= 0.23 && xDouble <= 0.46 && yDouble >= 0.26 && yDouble <= 0.34) {
            location = "Cafeteria"
            } else
        if (xDouble >= 0.185 && xDouble <= 0.395 && yDouble >= 0.46 && yDouble <= 0.55) {
            location = "Auditorium"
            } else
        if (xDouble >= 0.42 && xDouble <= 0.46 && yDouble >= 0.46 && yDouble <= 0.556) {
                location = "Back Stage in Auditorium"
            } else
        if (xDouble >= 0.495 && xDouble <= 0.56 && yDouble >= 0.46 && yDouble <= 0.555) {
            location = "Wresting Room"
            }
        if (xDouble >= 0.611 && xDouble <= 0.859 && yDouble >= 0.064 && yDouble <= 0.085) {
            location = "Foyer"
        }
        if (xDouble >= 0.185 && xDouble <= 0.424 && yDouble >= 0.819 && yDouble <= 0.835) {
            location = "Chem Hallway"
        }
        return location
    }
    
}
