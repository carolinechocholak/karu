//
//  SignUpViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/3/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var Background: UIImageView!
    let recognizer = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTF.delegate = self
        self.usernameTF.delegate = self
        self.EmailTF.delegate = self
        self.NameTF.delegate = self
        self.profileImage.layer.cornerRadius = profileImage.frame.size.width / 2.0
        self.profileImage.clipsToBounds = true
        self.profileImage.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    @IBAction func signupButtonPressed(_ sender: Any) {
        let email = EmailTF.text!
        let password = passwordTF.text!
        Auth.auth().createUser(withEmail: email, password: password, completion : {(user, error) in
            if(error != nil){
                print(error.debugDescription)
            }
            if let u = user {
                print(u.uid)
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.NameTF.text!
                changeRequest?.commitChanges { (error) in
                    self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
                }
            }
            print("success")
        })
    }
    
    func picTapped() {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.passwordTF.resignFirstResponder()
        self.usernameTF.resignFirstResponder()
        self.EmailTF.resignFirstResponder()
        self.NameTF.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        if touch.view == self.profileImage {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = .photoLibrary
        
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    fileprivate func fieldsFilled() -> Bool {
        if(passwordTF.text == nil || usernameTF.text == nil || EmailTF.text == nil || NameTF.text == nil) {
            return false
        }
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcc = segue.destination as? TeamPageViewController {
            vcc.newUser = true
        }
    }
 

}
