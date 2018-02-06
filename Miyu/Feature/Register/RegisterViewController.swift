//
//  RegisterViewController.swift
//  Simi
//
//  Created by Mira Estil on 2/3/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit

/// RegisterViewController initial build of User's profile before main home page.
internal final class RegisterViewController: BaseViewController {
    
    private var fbManager = FirebaseUserManager.manager
    private var viewModel: RegisterViewModel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        viewModel = RegisterViewModel(presentingViewController: self)
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        guard let email = emailLabel.text,
            let password = passwordLabel.text else {
                return
        }
        
        let user = AppUser(email: email, password: password)
        fbManager.createUser(user: user) { [weak self] in
            self?.viewModel?.presentRootController()
        }
    }
    
}
