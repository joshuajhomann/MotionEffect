//
//  UIViewExtension.swift
//  MotionEffect
//
//  Created by Joshua Homann on 5/3/17.
//  Copyright © 2017 josh. All rights reserved.
//

import UIKit

extension UIView {
    func addMotionDisplacement (xAxisAmount: CGFloat = .nan, yAxisAmount: CGFloat = .nan) {
        guard UIAccessibilityIsReduceMotionEnabled() == false, (xAxisAmount != .nan || yAxisAmount != .nan) else {
            return
        }

        let effectsGroup = UIMotionEffectGroup()
        effectsGroup.motionEffects = []
        if xAxisAmount != .nan {
            let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
            horizontal.minimumRelativeValue = -xAxisAmount
            horizontal.maximumRelativeValue = xAxisAmount
            effectsGroup.motionEffects?.append(horizontal)
        }
        if yAxisAmount != .nan {
            let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
            vertical.minimumRelativeValue = -yAxisAmount
            vertical.maximumRelativeValue = yAxisAmount
            effectsGroup.motionEffects?.append(vertical)
        }
        addMotionEffect(effectsGroup)
    }
}
