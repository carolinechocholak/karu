//
//  SignUpViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/3/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var Background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NameTF.layer.cornerRadius = 20.0
       // self.NameTF.layer.borderWidth = 2.0
        self.NameTF.layer.borderWidth = 5.0
        self.NameTF.layer.borderColor = UIColor.white.cgColor
        self.NameTF.layer.masksToBounds = true
        self.passwordTF.layer.cornerRadius = 20.0
        self.passwordTF.layer.borderWidth = 2.0
        self.passwordTF.layer.masksToBounds = true
        self.passwordTF.layer.borderColor = UIColor.white.cgColor
        self.usernameTF.layer.cornerRadius = 20.0
        self.usernameTF.layer.borderWidth = 2.0
        self.usernameTF.layer.masksToBounds = true
        self.usernameTF.layer.borderColor = UIColor.white.cgColor
        self.EmailTF.layer.cornerRadius = 20.0
        self.EmailTF.layer.borderWidth = 2.0
        self.EmailTF.layer.masksToBounds = true
        self.EmailTF.layer.borderColor = UIColor.white.cgColor
        
        
        
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
