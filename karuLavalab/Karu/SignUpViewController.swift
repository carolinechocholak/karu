//
//  SignUpViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/3/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
