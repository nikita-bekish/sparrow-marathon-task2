//
//  AnimatableButton.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

final class AnimatableButton: UIButton {
    
    // MARK: - Private properties
    
    private var scaleDownAnimator = UIViewPropertyAnimator()
    private var scaleUpAnimator = UIViewPropertyAnimator()
    
    // MARK: - Init
        
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        configuration = .filled()
        configuration?.cornerStyle = .medium
        configuration?.image = UIImage(systemName: "arrow.forward.circle")
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = 8
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        configurationUpdateHandler = { button in
            var config = button.configuration
            
            config?.background.backgroundColor = button.tintAdjustmentMode == .dimmed ? .systemGray2 : .systemBlue
            
            switch button.tintAdjustmentMode {
            case .normal:
                config?.imageColorTransformer = UIConfigurationColorTransformer { _ in
                    return .white
                }
                config?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                    var outgoing = incoming
                    outgoing.foregroundColor = .white
                    
                    return outgoing
                })
            case .dimmed:
                config?.imageColorTransformer = UIConfigurationColorTransformer { _ in
                    return .systemGray3
                }
                config?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                    var outgoing = incoming
                    outgoing.foregroundColor = .systemGray3
                    
                    return outgoing
                })
                
            case .automatic:
                break
            @unknown default:
                break
            }
            
            button.configuration = config
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIButton touches
    
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
