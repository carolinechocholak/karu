//
//  OrgViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/22/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class OrgViewController: UIViewController {

    
   
    @IBOutlet weak var dataStackView: UIStackView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var nameStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func groupButtonTouched(_ sender: Any) {
         self.performSegue(withIdentifier: "orgToGroupSegue", sender: self)
        //self.animateButton()
    }
    
    func animateButton() {
        UIView.animate(withDuration: 0.5, animations: {
            
            
            self.buttonStackView.frame.origin.y += 49
            self.buttonStackView.frame.origin.x -= 5
            self.dataStackView.frame.origin.y += 49
            self.dataStackView.frame.origin.x -= 5
            self.nameStackView.frame.origin.y += 41
            self.nameStackView.frame.origin.x -= 5
            self.profilePic.frame.origin.y += 21
            self.profilePic.frame.origin.x -= 15
            self.profilePic.frame.size.width += 20
            self.profilePic.frame.size.height += 20
            /*   let newImage = UIImage(named: "Organization Button Pressed")
             let otherImage = UIImage(named: "Team Button 3")
             self.groupButton.setImage(newImage, for: UIControlState.normal)
             self.teamButton.setImage(otherImage, for: UIControlState.normal) */
            
        }) {finished in
            self.timeToMoveOn()
        }
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "orgToGroupSegue", sender: self)
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
