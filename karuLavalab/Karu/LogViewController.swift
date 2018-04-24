//
//  LogViewController.swift
//  Karu
//
//  Created by John Zeiders on 4/23/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class LogViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var teamCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let displayName = user?.displayName
        
        getTeamInfo()
        
        nameLabel.text = displayName
        
        
        
        // Do any additional setup after loading the view.
    }
    fileprivate func getTeamInfo() {
        let user = Auth.auth().currentUser
        let uid = user!.uid
        let teamsRef = Firestore.firestore().collection("Teams")
        let query = teamsRef.whereField("users.\(uid)", isEqualTo: true)
        query.getDocuments {(querysnapshot, err) in
            if let err = err {
                print("Error getting docs: \(err)")
            } else {
                self.setTeamCount(querySnapshot: querysnapshot!)
            }
        }
    }
    func setTeamCount(querySnapshot: QuerySnapshot) {
        self.teamCountLabel.text = (String(querySnapshot.count) + "\n Teams")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
