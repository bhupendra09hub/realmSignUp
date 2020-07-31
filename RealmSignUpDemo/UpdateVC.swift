//
//  UpdateVC.swift
//  RealmSignUpDemo
//
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift

class UpdateVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfUserID: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfConfirmPwd: UITextField!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var vwUpdate: UIView!
    //MARK:- Variables
    var realm = try! Realm()
    var usrData = Users()
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUserName.text = usrData.uName
        tfUserID.text = usrData.uId
        tfPwd.text = usrData.upwd
        tfConfirmPwd.text = usrData.upwd
    }
    //MARK:- Update Button
    @IBAction func updateAction(_ sender: UIButton) {
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
            UpdateData(uName: tfUserName.text!, uId:tfUserID.text!, uPwd: tfPwd.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    //MARK:-Supporting Update Func
    func UpdateData(uName:String, uId:String, uPwd:String) {
        let urData = Users()
        try! realm.write({
            urData.uName = uName
            urData.uId = uId
            urData.upwd = uPwd
            realm.add(urData, update: Realm.UpdatePolicy.all)
        })
    }
    

}
