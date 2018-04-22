//
//  eventDetailsViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/22/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class UILabelPadding: UILabel {
    
    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    
    
}


class eventDetailsViewController: UIViewController {

    @IBOutlet weak var NotGoingButton: UIButton!
    @IBOutlet weak var GoingButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var announcementsDetail: UILabelPadding!
    
    @IBOutlet weak var timeLabel: UILabelPadding!
    @IBOutlet weak var dateDetail: UILabelPadding!
    @IBOutlet weak var locationDetail: UILabelPadding!
    
    override func viewDidLoad() {
         super.viewDidLoad()
       
        
        
        
       
        GoingButton.isHidden = true
        NotGoingButton.isHidden = true
        let customColor = UIColor(red: 89.0/255.0, green: 183.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        
        announcementsDetail.layer.borderColor = customColor.cgColor
        announcementsDetail.layer.borderWidth = 1.5
        announcementsDetail.layer.cornerRadius = 5.0
        announcementsDetail.layer.masksToBounds = true
        
        timeLabel.layer.borderColor = customColor.cgColor
        timeLabel.layer.borderWidth = 1.5
        timeLabel.layer.cornerRadius = 5.0
        
        dateDetail.layer.borderWidth = 1.5
        dateDetail.layer.borderColor = customColor.cgColor
        dateDetail.layer.cornerRadius = 5.0
        
        locationDetail.layer.borderColor = customColor.cgColor
        locationDetail.layer.borderWidth = 1.5
        locationDetail.layer.cornerRadius = 5.0
        

        // Do any additional setup after loading the view.
    }

    
    @IBAction func updateTouched(_ sender: Any) {
        self.updateButton.isHidden = true
        self.GoingButton.isHidden = false
        self.NotGoingButton.isHidden = false
    }
    

    @IBAction func goingTouched(_ sender: Any) {
        let alertController = UIAlertController(title: "You have just changed your status to this event to Going, is this correct?", message: "This is an alert.", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Confirm", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        
        
        let action2 = UIAlertAction(title: "Back", style: .destructive) { (action:UIAlertAction) in
            print("You've pressed the destructive");
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
      
        self.present(alertController, animated: true, completion: nil)
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
