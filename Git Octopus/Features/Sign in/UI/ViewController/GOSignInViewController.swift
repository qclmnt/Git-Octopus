//
//  GOSignInViewController.swift
//  Git Octopus
//
//  Created by Quentin CLEMENT on 05/11/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class GOSignInViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var signInButton: UIButton?
    @IBOutlet weak var iconImageView: UIImageView?
    
    lazy var viewModel: GOSignInViewControllerViewModel = GOSignInViewControllerViewModel()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Text configuration
        self.titleLabel?.text = self.viewModel.signInTitle
        self.subtitleLabel?.text = self.viewModel.signInSubtitle
        self.signInButton?.setTitle(self.viewModel.signInButtonTitle, for: .normal)
        
        // Layout configuration
        self.signInButton?.layer.cornerRadius = GOLayoutConstant.cornerRadius
        
        // Animations
        self.addOctopusAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addOctopusAnimation), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Actions
    
    @IBAction func signInButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel.signInWithGithub()
    }
    
    // MARK: - Animation
    
    @objc private func addOctopusAnimation() {
        
        // Create scale animation
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 0.9
        
        // Create translation animation
        
        let translationAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        translationAnimation.fromValue = 20.0
        translationAnimation.toValue = 0
        
        // Create group animation
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2
        groupAnimation.autoreverses = true
        groupAnimation.fillMode = .forwards
        groupAnimation.repeatCount = .infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        groupAnimation.animations = [scaleAnimation, translationAnimation]

        self.iconImageView?.layer.add(groupAnimation, forKey: "octopus_animation")
    }
    
}
