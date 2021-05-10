//
//  IncidentLocationView.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import Foundation
import UIKit

@IBDesignable
class IncidentLocationView: UIImageView {
    
    var floors: [UIImage] = [];
    let drawingLayer = CAShapeLayer()
    var locations: [Location] = [];
    
    var currentlyDisplayedFloor = 1;
    var pointBounds: [CGRect] = [];
    let pointSize: CGFloat = 18;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
        layer.addSublayer(drawingLayer);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        calculatePoints();
    }
    
    public func setFloorImages(_ floors: [UIImage]) {
        self.floors = floors;
    }
    
    public func addLocation(_ location: Location) {
        locations.append(location);
        calculatePoints();
    }
    
    // Much more efficient than addLocation for many points
    public func addLocations(_ locations: [Location]) {
        self.locations.append(contentsOf: locations);
        calculatePoints();
    }
    
    public func clearLocations() {
        locations = [];
        calculatePoints();
    }
    
    public func showFloor(_ floor: Int) {
        assert(floor > 0 && floor <= floors.count);
        // Subtract 1 to make the input 1-indexed instead of 0-indexed.
        // This line is out of if statement in case currentlyDisplayedFloor is not the actual floor being shown/
        image = floors[floor - 1];
        if (currentlyDisplayedFloor != floor) {
            currentlyDisplayedFloor = floor;
            calculatePoints();
        }
    }
    
    private func calculatePoints() {
        pointBounds = [];
        let locationsToDisplay = locations.filter({location in
            return location.floor == currentlyDisplayedFloor;
        });
        if (locationsToDisplay.count > 0) {
            let frameSize = self.frame.size;
            let imageSize = self.image!.size;
            let shrinkx = imageSize.width/frameSize.width;
            let shrinky = imageSize.height/frameSize.height;
            var off = self.frame;
            off.origin = CGPoint(x: 0, y: 0)
            if(shrinkx > shrinky) {
                off.size.height = imageSize.height/shrinkx;
                off.origin.y += (frameSize.height - off.height) / 2;
            } else {
                off.size.width = imageSize.width/shrinky;
                off.origin.x += (frameSize.width - off.width) / 2;
            }
            
            for location in locations {
                let pos = location.pos;
                var circleRect = CGRect(origin: off.origin, size: CGSize(width: pointSize, height: pointSize));
                circleRect = circleRect.offsetBy(dx: off.width * pos.x, dy: off.height * pos.y);
                circleRect = circleRect.offsetBy(dx: -pointSize/2, dy: -pointSize/2);
                pointBounds.append(circleRect);
            }
        }
        updateDrawingOverlay();
    }
    
    private func updateDrawingOverlay() {
        let path = CGMutablePath();
        for pointBound in pointBounds {
            path.addEllipse(in: pointBound);
        }
        
        drawingLayer.path = path;
        drawingLayer.fillColor = UIColor.red.cgColor;
        
        setNeedsDisplay()
    }
}
