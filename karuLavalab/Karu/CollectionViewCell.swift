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
                self.backgroundColor = UIColor.blue
                self.orgName.textColor = UIColor.white
                self.orgName.alpha = 1
                self.alpha = 1
                
            }
            else
            {
                self.backgroundColor = UIColor.white
                self.orgName.textColor = UIColor.lightGray
                self.alpha = 0.4
                
            }
        }
    }
    
    
   
    
    
}
