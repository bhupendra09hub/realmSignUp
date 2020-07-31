//
//  UserListVC.swift
//  RealmSignUpDemo
//
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift
class UserListVC: UIViewController {

    @IBOutlet weak var tblViewUsr: UITableView!
    var realm = try! Realm()
    var userData:Results<Users>!
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveData()
        
    }
    func retriveData() {
        userData = realm.objects(Users.self)
    }
    @IBAction func addUserAction(_ sender: UIButton) {
        let signUpVc = storyboard?.instantiateViewController(withIdentifier: "SignUPVC") as! SignUPVC
        navigationController?.pushViewController(signUpVc, animated: true)
    }
        override func viewWillAppear(_ animated: Bool) {
        tblViewUsr.reloadData()
    }
}
extension UserListVC:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewUsr.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as! UserListCell
        let user = userData![indexPath.row]
        cell.lblUsrID.text = user.uId
        cell.lblUsrName.text = user.uName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let usrs = userData[indexPath.row]
        let usrList =  storyboard?.instantiateViewController(withIdentifier: "UpdateVC") as! UpdateVC
            usrList.usrData = usrs
        navigationController?.pushViewController(usrList, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let users = userData[indexPath.row]
            try! realm.write({
                realm.delete(users)
            })
        }
        tblViewUsr.reloadData()
    }
    
}
