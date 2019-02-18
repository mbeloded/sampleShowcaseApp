//
//  AnimationsHelper.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/18/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class AnimationsHelper {

    public static let bounceAnimationName = "bounceAnimation"
    fileprivate static let bounceAnimationTime = 0.35
    
    public static func bounce(_ sender: UIView) {
        //
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(bounceAnimationTime)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        sender.layer.add(bounceAnimation, forKey: bounceAnimationName)
    }

}
