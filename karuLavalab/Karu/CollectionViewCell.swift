//
//  CollectionViewCell.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/5/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var orgName: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.backgroundColor = UIColor.white
                self.orgName.textColor = UIColor.black
                self.orgName.alpha = 1
                self.orgName.backgroundColor = UIColor(displayP3Red: 0/255.0, green: 187.0/255.0, blue: 100/255.0, alpha: 1.0)
                self.alpha = 1.0
                
                
                
            }
            else
            {
                self.backgroundColor = UIColor.white
                self.alpha = 0.4
                self.orgName.backgroundColor = UIColor.clear
                self.orgName.alpha = 1
                self.orgName.textColor = UIColor.black
                
            }
        }
    }
    
    
   
    
    
}
