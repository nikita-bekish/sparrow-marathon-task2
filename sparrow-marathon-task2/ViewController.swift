//
//  ViewController.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let thirdButton: AnimatableButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.image = UIImage(systemName: "arrow.forward.circle")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        let button = AnimatableButton()
        button.setTitle("Third", for: .normal)
        button.configurationUpdateHandler = { button in
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
        
        button.configuration = config
        
        return button
    }()
    
    private let secondButton: AnimatableButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.image = UIImage(systemName: "arrow.forward.circle")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        
        let button = AnimatableButton()
        button.setTitle("Second Medium Button", for: .normal)
        button.configurationUpdateHandler = { button in
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
        button.configuration = config
        return button
    }()
    
    private let firstButton: AnimatableButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.image = UIImage(systemName: "arrow.forward.circle")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        let button = AnimatableButton()
        button.setTitle("First Button", for: .normal)
        button.configurationUpdateHandler = { button in
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
        button.configuration = config
        return button
    }()
    
    // MARK: - UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // MARK: - Private methods
    
    private func setupUI() {
        [firstButton, secondButton, thirdButton,].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
        ])
        
        thirdButton.addAction(UIAction(handler: { _ in
            self.showBlankController()
        }), for: .touchUpInside)
    }
    
    @objc private func showBlankController() {
        self.present(UINavigationController(rootViewController: BlankViewController()), animated: true)
    }
    
}

