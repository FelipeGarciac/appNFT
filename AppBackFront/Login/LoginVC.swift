//
//  ViewController.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 22/07/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loguinScreen: LoginScreen?
   
    
    override func loadView() {
        loguinScreen = LoginScreen()
        view = loguinScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}

