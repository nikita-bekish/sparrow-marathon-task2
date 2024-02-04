//
//  AnimatableButton.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

final class AnimatableButton: UIButton {
    var scaleDownAnimator = UIViewPropertyAnimator()
    var scaleUpAnimator = UIViewPropertyAnimator()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if scaleUpAnimator.isRunning {
            scaleUpAnimator.stopAnimation(true)
        }
        
        scaleDownAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        scaleDownAnimator.startAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if scaleDownAnimator.isRunning {
            scaleDownAnimator.stopAnimation(true)
        }
        
        scaleUpAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn) {
            self.transform = .identity
        }
        scaleUpAnimator.startAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        if scaleDownAnimator.isRunning {
            scaleDownAnimator.stopAnimation(true)
        }
        
        scaleUpAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
            self.transform = .identity
        }
        scaleUpAnimator.startAnimation()
    }
}
