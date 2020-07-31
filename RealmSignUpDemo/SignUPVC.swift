//
//  SignUPVC.swift
//  RealmSignUpDemo
//
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift

class SignUPVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var vwSignUp: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfUserID: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfConfirmPwd: UITextField!
    //MARK:- Variables
    let realm = try! Realm()
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK:- SignUp Action
    @IBAction func signUpAction(_ sender: UIButton) {
        if tfUserName.text!.isEmpty && tfUserID.text!.isEmpty && tfPwd.text!.isEmpty && tfConfirmPwd.text!.isEmpty {
            print("Fill below all field")
            return
        } else if tfUserName!.text!.isEmpty {
            print("Enter User Name")
            return
        } else if tfUserID.text!.isEmpty {
            print("Enter User Id")
            return
        } else if tfConfirmPwd.text!.isEmpty {
            print("Enter Confirm Pwd")
            return
        } else if tfPwd.text != tfConfirmPwd.text {
            print("Password not matched")
            return
        } else {
            saveData(usrName: tfUserName.text!, usrID: tfUserID.text!, usrPwd: tfPwd.text!)
            tfUserName!.text = ""
            tfUserID.text = ""
            tfConfirmPwd.text = ""
            tfPwd.text = ""
            navigationController?.popViewController(animated: true)
        }
        
    }
    //MARK:- RealmDataSaveFunc
    func saveData (usrName:String, usrID:String, usrPwd:String) {
        let usrData = Users()
        usrData.uName = usrName
        usrData.uId = usrID
        usrData.upwd = usrPwd
        realm.beginWrite()
        realm.add(usrData)
        try! realm.commitWrite()
    }
}
