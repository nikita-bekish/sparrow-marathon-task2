//
//  Animatable.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

protocol AnimatableType: UIView {
    var bounceScale: CGFloat { get set }
    
    func viewToScale() -> UIView
}

extension AnimatableType {
    
    func animateScaling(isBounced: Bool) {
        print("nik animateScaling called bounceScale", bounceScale, "isBounced", isBounced)
//        let timingParams = UISpringTimingParameters(dampingRatio: 10)
//        let animator = UIViewPropertyAnimator(duration: 5, timingParameters: timingParams)
        let animator = UIViewPropertyAnimator(duration: 2, curve: .linear)
        
        animator.addAnimations {
            self.scalingAnimationBlock(isBounced: isBounced)
        }
        animator.addCompletion { _ in
            print("nik completion called")
        }
        
        animator.isInterruptible = true
        animator.startAnimation()
    }
    
    func scalingAnimationBlock(isBounced: Bool) {
        let scaleTransform = isBounced ? CGAffineTransform(scaleX: bounceScale, y: bounceScale) : .identity
        
        let viewToScale = viewToScale()
        print("nik scaleTransform", scaleTransform)
        viewToScale.transform = scaleTransform
    }
}
