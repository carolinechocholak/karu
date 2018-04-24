//
//  OrgViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/22/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class OrgViewController: UIViewController {

    
    @IBOutlet weak var backgroundPic: UILabel!
    
    @IBOutlet weak var dataStackView: UIStackView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var charityData: UITextView!
    
    @IBOutlet weak var teamCountLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var nameStackView: UIStackView!
    
    @IBOutlet weak var export1: UIButton!
    
    @IBOutlet weak var export2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let displayName = user?.displayName
        self.segmentedControl.layer.cornerRadius = 20.0
        segmentedControl.tintColor = UIColor.white
        getTeamInfo()
        self.charityData.isHidden = true
        
        nameLabel.text = displayName
        self.backgroundPic.layer.cornerRadius = 5.0
        self.button1.layer.cornerRadius = 5.0
        self.button1.layer.borderColor = UIColor.white.cgColor
        self.button1.layer.borderWidth = 1.0
        
        self.button2.layer.cornerRadius = 5.0
        self.button2.layer.borderColor = UIColor.white.cgColor
        self.button2.layer.borderWidth = 1.0
        
        self.button3.layer.cornerRadius = 5.0
        self.button3.layer.borderColor = UIColor.white.cgColor
        self.button3.layer.borderWidth = 1.0
        
        

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

    
    
    @IBAction func firstButtonPressed(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
        if (self.charityData.isHidden){
            self.charityData.frame.size.height = 0
            self.charityData.isHidden = false
            self.charityData.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.button2.frame.origin.y += 115
                self.button3.frame.origin.y += 115
                self.charityData.frame.size.height += 105
                self.export1.frame.origin.y += 115
                self.export2.frame.origin.y += 115
                })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.button2.frame.origin.y -= 115
                self.button3.frame.origin.y -= 115
                self.charityData.frame.size.height -= 105
                self.export1.frame.origin.y -= 115
                self.export2.frame.origin.y -= 115
                
            }, completion: { finished in
                self.charityData.isHidden = true
            })
        }
        }
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            self.button1.setTitle("Swim With Mike", for: UIControlState.normal)
            self.button2.setTitle("Relay For Life", for: UIControlState.normal)
            self.button3.setTitle("Cycle For Survival", for: UIControlState.normal)
        }
        else {
            self.button1.setTitle("Midnight Mission", for: UIControlState.normal)
            self.button2.setTitle("Once Voice", for: UIControlState.normal)
            self.button3.setTitle("Heal the Bay", for: UIControlState.normal)
        }
    }
    
    
    @IBAction func groupButtonTouched(_ sender: Any) {
         self.performSegue(withIdentifier: "orgToGroupSegue", sender: self)
        //self.animateButton()
    }
    
    @IBAction func share1(_ sender: Any) {
        let alertController = UIAlertController(title: "Share this organization with:", message: "", preferredStyle: .alert)
        let backView = alertController.view.subviews.last?.subviews.last
        backView?.layer.cornerRadius = 10.0
        backView?.backgroundColor = UIColor.white
        let action1 = UIAlertAction(title: "Lavalab", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
           
        }
        
        
        let action2 = UIAlertAction(title: "USC Field Hockey", style: .default) { (action:UIAlertAction) in
            print("You've pressed the destructive");
        }
        let action3 = UIAlertAction(title: "Alpha Phi", style: .default) { (action:UIAlertAction) in
            print("You've pressed the destructive");
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
   
    @IBAction func share2(_ sender: Any) {
        share1(self)
    }
    
    @IBAction func share3(_ sender: Any) {
        share1(self)
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
