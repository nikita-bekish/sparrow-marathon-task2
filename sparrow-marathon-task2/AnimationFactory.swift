//
//  AnimationFactory.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

class AnimatorFactory {
    
    func toggleScale(view: UIView, isBounced: Bool) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, animations: {
            view.transform = isBounced ? CGAffineTransform(scaleX: 0.1, y: 0.1) : .identity
        })
    }
    
    @discardableResult
    static func scaleDown(view: UIView) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0) {
            view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }

        return animator
    }
    
    @discardableResult
    static func scaleIdentity(view: UIView) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0) {
            view.transform = .identity
        }

        return animator
    }
}
