//  PopUpView.swift
//  RealmSignUpDemo
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.

import Foundation
import UIKit
extension UIViewController {
    func popUpmsg(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
