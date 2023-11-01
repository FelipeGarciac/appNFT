//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by Felipe Garcia on 24/10/23.
//

import Foundation
import UIKit

extension UIViewController{
    func dismissKeyBoard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
