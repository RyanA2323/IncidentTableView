//
//  Location.swift
//  IncidentTableView
//
//  Created by Tiger Coder on 4/8/21.
//

import Foundation
import UIKit

class Location {
    public var pos: CGPoint;
    public var floor: Int;
    
    init(pos: CGPoint, floor: Int) {
        self.pos = pos;
        self.floor = floor;
    }
}
