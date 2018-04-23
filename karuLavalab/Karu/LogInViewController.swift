//
//  LogInViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/9/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTF.delegate = self
        self.usernameTF.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        if fieldFilled(){
            let email = usernameTF.text!
            let password = passwordTF.text!
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let u = user {
                    print(u.uid)
                    self.performSegue(withIdentifier: "BeginSegue", sender: nil)
                    
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func fieldFilled() -> Bool {
        if(usernameTF.text == nil || passwordTF.text == nil) {
            return false
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.passwordTF.resignFirstResponder()
        self.usernameTF.resignFirstResponder()
        return true;
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
 

}
