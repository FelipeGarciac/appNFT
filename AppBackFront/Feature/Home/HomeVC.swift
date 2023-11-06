//
//  Home VC.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 05/11/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    



}
