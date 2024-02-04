//
//  ViewController.swift
//  sparrow-marathon-task2
//
//  Created by Nikita Bekish on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private types
    
    private struct Constants {
        static let offset: CGFloat = 20
    }
    
    // MARK: - Private properties
    
    private let firstButton = AnimatableButton(title: "First Button")
    
    private let secondButton = AnimatableButton(title: "Second Medium Button")

    private let thirdButton = AnimatableButton(title: "Third")
    
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
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.offset),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: Constants.offset),
            
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: Constants.offset),
        ])
        
        thirdButton.addTarget(self, action: #selector(showBlankController), for: .touchUpInside)
    }
    
    @objc private func showBlankController() {
        self.present(UINavigationController(rootViewController: BlankViewController()), animated: true)
    }
}

