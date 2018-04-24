//
//  CreateTeamViewController.swift
//  Karu
//
//  Created by John Zeiders on 4/22/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//
import UIKit
import Firebase

class CreateTeamViewController: UIViewController {
    
    @IBOutlet weak var teamNameField: UITextField!
    
    @IBOutlet weak var teamMissionField: UITextView!
    
    @IBOutlet weak var teamCityField: UITextField!
    
    @IBOutlet weak var teamSchoolField: UITextField!
    
    @IBOutlet weak var teamWebsiteField: UITextField!
    
    @IBOutlet weak var teamEmailField: UITextField!
    
    @IBOutlet weak var teamCodeField: UITextField!
    
    
    @IBOutlet weak var createTeamButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameField.setBottomBorder()
        teamMissionField.layer.borderWidth = 1.0
        teamMissionField.layer.borderColor = UIColor.gray.cgColor
        teamMissionField.layer.cornerRadius = 5.0
        teamCityField.setBottomBorder()
        teamSchoolField.setBottomBorder()
        teamWebsiteField.setBottomBorder()
        teamEmailField.setBottomBorder()
        teamCodeField.setBottomBorder()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createTeamPressed(_ sender: Any) {
        createTeam()
    }
   
    fileprivate func createTeam() {
        guard let teamName = teamNameField.text,
        let teamMission = teamMissionField.text,
        let teamCity = teamCityField.text,
        let teamSchool = teamSchoolField.text,
        let teamWebsite = teamWebsiteField.text,
        let teamEmail = teamEmailField.text,
        let teamCode = teamCodeField.text else {
            return
        }
        let team = Team(name: teamName, city: teamCity, code: teamCode, mission: teamMission, school: teamSchool, website: teamWebsite, email: teamEmail)
        let teamsRef = Firestore.firestore().collection("Teams")
        var ref: DocumentReference? = nil
        ref = teamsRef.addDocument(data: team.dictionary) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                self.performSegue(withIdentifier: "CreateTeamFinished", sender: nil)
            }
        }
            

        
    }
    
    
    @IBAction func doneEditing(_ sender: Any) {
        self.resignFirstResponder()
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
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

