//
//  CustomTimingCurveProvider.swift
//  UIAnimationTutorial
//
//  Created by Jason Newell on 6/15/16.
//  Copyright © 2016 Lumarow. All rights reserved.
//

import Foundation
import UIKit

class CustomTimingCurveProvider: UITimingCurveProvider {
    internal var timingCurveType: UITimingCurveType {
        return .composed
    }    
    internal var cubicTimingParameters: UICubicTimingParameters? {
        return UICubicTimingParameters(animationCurve: .easeOut)
    }
    internal var springTimingParameters: UISpringTimingParameters? {
        return nil
    }
    
    
    required init() {}
    
    internal func encode(with aCoder: NSCoder) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
//        self.cubicTimingParameters = aDecoder.decodeObject(forKey: "cubicParams") as? UICubicTimingParameters
//        self.springTimingParameters = aDecoder.decodeObject(forKey: "springParams") as? UISpringTimingParameters
    }

    
    internal func copy(with zone: NSZone? = nil) -> AnyObject {
        return self.dynamicType.init()
    }
}
