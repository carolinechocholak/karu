//
//  BeginViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/17/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class BeginViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeText.alpha = 0
        self.background.alpha = 0
        animate()

        // Do any additional setup after loading the view.
    }

    func animate() {
        UIView.animate(withDuration: 1, animations: {
            self.welcomeText.alpha = 0
            self.background.alpha = 0
        }) { (finished) in
            self.fadeIn()
        }
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 1, animations: {
            self.welcomeText.alpha = 1
            self.background.alpha = 1
        }) 
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
