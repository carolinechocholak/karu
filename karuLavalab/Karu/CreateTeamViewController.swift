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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

