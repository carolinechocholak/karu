//
//  TeamPageViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/16/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class TeamPageViewController: UIViewController {
    var myButton: UIButton!
    @IBOutlet weak var groupButton: UIButton!
    
    @IBOutlet weak var IntroTextView: UITextView!
    @IBOutlet weak var IntroLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var buttonsView: UIView!
    
    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var dataStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamCountLabel: UILabel!
    var newUser: Bool?
    var currY: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let displayName = user?.displayName
        
        nameLabel.text = displayName
       
       // getTeamInfo()
        if newUser != nil { // display new message
            self.IntroLabel.isHidden = false
            self.IntroTextView.isHidden = false
            self.buttonsView.isHidden = true
        } else { // don't display, print out buttons for teams
            self.IntroLabel.isHidden = true
            self.IntroTextView.isHidden = true
            self.buttonsView.isHidden = false
            // create buttons here
            buttonsView.addSubview((makeButtonWithText(text: "Lavalab")))
            makeTeamLeaderButton(text: "USC Field Hockey")
            
        }
        newUser = false
        
        

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
                self.setTeamButtons(querySnapshot: querysnapshot!)
            }
        }
    }
    func setTeamCount(querySnapshot: QuerySnapshot) {
        self.teamCountLabel.text = (String(querySnapshot.count) + "\n Teams")
    }
    func setTeamButtons(querySnapshot: QuerySnapshot) {
        querySnapshot.documents.forEach({(document) in
            let team = Team(dictionary: document.data())
            self.buttonsView.addSubview((self.makeButtonWithText(text: team!.name)))
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func groupButtonTouched(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "groupToOrgSegue", sender: self)
       
        //self.animateButton()
        
       
    }
    
    // use this function for team leaders
    func makeTeamLeaderButton(text: String) {
        let myButton = UIButton(type: UIButtonType.system)
        //Set a frame for the button. Ignored in AutoLayout/ Stack Views
        
        myButton.frame = CGRect(x: 68, y: currY, width: 200, height: 50)
        let buttonBackground = UIImage(named: "Team Name 2")
        
        myButton.layer.cornerRadius = 5
       
        myButton.setBackgroundImage(buttonBackground, for: UIControlState.normal)
        
        
        myButton.titleLabel?.textAlignment = NSTextAlignment.center
        myButton.setTitle(text, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        
        myButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        myButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        myButton.layer.shadowOpacity = 0.3
        
       
            let leaderButton = UIButton(type: UIButtonType.system)
            //leaderButton.frame = CGRect(x: 18, y: currY, width: 50, height: 50)
            let leaderPic = UIImage(named: "leaderButton")
            leaderButton.setBackgroundImage(leaderPic, for: UIControlState.normal)
            leaderButton.frame = CGRect(x: 38, y: currY+3, width: 30, height: 35)
        
            
        
        
        leaderButton.addTarget(self, action: #selector(toTeamData), for: .touchUpInside)
        myButton.addTarget(self,
                           action: #selector(helloButton),
                           for: .touchUpInside
        )
        
        currY += 58
        self.buttonsView.addSubview(myButton)
        self.buttonsView.addSubview(leaderButton)
        
    }
    
    func makeButtonWithText(text:String) -> UIButton {
        let myButton = UIButton(type: UIButtonType.system)
        //Set a frame for the button. Ignored in AutoLayout/ Stack Views
        myButton.frame = CGRect(x: 68, y: currY, width: 200, height: 50)
        
        let buttonBackground = UIImage(named: "Team Name 2")
        
        myButton.layer.cornerRadius = 5
        //Set background color
       //myButton.backgroundColor = UIColor.lightGray
        myButton.setBackgroundImage(buttonBackground, for: UIControlState.normal)
        
      
        myButton.titleLabel?.textAlignment = NSTextAlignment.center
        myButton.setTitle(text, for: UIControlState.normal)
        myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
       
        
        myButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        myButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        myButton.layer.shadowOpacity = 0.3
     
        
        myButton.addTarget(self,
                           action: #selector(helloButton),
                           for: .touchUpInside
        )
        currY += 58
        return myButton
    }
    @IBAction func helloButton(sender:UIButton){
        self.performSegue(withIdentifier: "toEventPageSegue", sender: self)
    }
    
    @IBAction func toTeamData(sender:UIButton){
        self.performSegue(withIdentifier: "toTeamDataSegue", sender: self)
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "groupToOrgSegue", sender: self)
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
