//
//  JoinTeamViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/14/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class JoinTeamViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var codeTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.codeTF.becomeFirstResponder();
        self.codeTF.backgroundColor = UIColor.clear
        self.codeTF.delegate = self
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: codeTF.frame.size.height - width, width:  codeTF.frame.size.width, height: codeTF.frame.size.height)
        
        border.borderWidth = width
        codeTF.layer.addSublayer(border)
        codeTF.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    @IBAction func joinTeamPressed(_ sender: Any) {
        let teamCode = codeTF.text!
        joinTeam(teamCode: teamCode)
    }
    
    fileprivate func joinTeam(teamCode: String) {
        let user =  Auth.auth().currentUser
        let teamsRef = Firestore.firestore().collection("Teams")
        let usersRef = Firestore.firestore().collection("Users")
        if let user = user {
            let uid = user.uid
            let query = teamsRef.whereField("code", isEqualTo: teamCode)
            query.getDocuments {(querysnapshot, err) in
                if let err = err {
                    print("Error getting docs: \(err)")
                } else {
                    for document in querysnapshot!.documents {
                        let docId = document.documentID
                        teamsRef.document(docId).updateData(["users.\(uid)": true])
                        usersRef.document(String(uid)).updateData(["teams.\(docId)" : true])
                        
                    }
                }
                self.performSegue(withIdentifier: "JoinedTeamSegue", sender: nil)
            }
        }
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeTF.resignFirstResponder()
        return true
    }

    
    // MARK: - Navigation

    /* In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.codeTF.resignFirstResponder();
    }
 

}
