//
//  Function.swift
//  DrawingApp
//
//  Created by Mac for Rav on 10/2/19.
//  Copyright © 2019 RayZhang. All rights reserved.
//

import Foundation
import UIKit

class Function {
    static func distance (a: CGPoint, b: CGPoint) -> CGFloat{
        return sqrt(pow(a.x - b.x,2) + pow(a.y - b.y,2))
    }
}
