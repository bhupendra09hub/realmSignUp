//
//  ViewController.swift
//  RealmSignUpDemo
//
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift
class SignInVC: UIViewController {
    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var vwSingIn: UIView!
    
    var realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveData()
        print(realm.configuration.fileURL)
    }
    
    @IBAction func signAction(_ sender: UIButton) {
        if tfUserId.text!.isEmpty && tfPwd.text!.isEmpty {
            popUpmsg(title: "Detail", msg: "Fill both field")
            print("Fill both field")
            return
        } else if tfUserId.text!.isEmpty {
            print("Enter user id")
            return
        } else if tfPwd.text!.isEmpty {
            print("Enter Password")
            return
        } else {
            let usrData = realm.objects(Users.self)
            for usr in usrData {
                let userName = usr.uName
                let userId = usr.uId
                let userPwd = usr.upwd
                print("\(userName),\(userId),\(userPwd)")
                if tfUserId.text == userId && tfPwd.text == userPwd {
                    let usrList = storyboard?.instantiateViewController(withIdentifier: "UserListVC") as! UserListVC
                    print("Success")
                    tfUserId.text = ""
                    tfPwd.text = ""
                    navigationController?.pushViewController(usrList, animated: true)
                    break
                } else {
                    print("Password not matched")
                }
            }
        }
        
    }
    @IBAction func singUpAction(_ sender: UIButton) {
        let signUp = storyboard?.instantiateViewController(withIdentifier: "SignUPVC") as! SignUPVC
        navigationController?.pushViewController(signUp, animated: true)
    }
    func retriveData () {
        let usrData = realm.objects(Users.self)
        for usr in usrData {
            let userName = usr.uName
            let userId = usr.uId
            let userPwd = usr.upwd
            print("\(userName),\(userId),\(userPwd)")
        }
    }
    

}

