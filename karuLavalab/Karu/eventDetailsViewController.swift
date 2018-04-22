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

    
    @IBOutlet weak var announcementsDetail: UILabelPadding!
    
    @IBOutlet weak var timeLabel: UILabelPadding!
    @IBOutlet weak var dateDetail: UILabelPadding!
    @IBOutlet weak var locationDetail: UILabelPadding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
