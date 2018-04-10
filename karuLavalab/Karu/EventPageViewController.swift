//
//  EventPageViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/4/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var eventScrollView: UICollectionView!
    let reuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        eventScrollView.backgroundColor = UIColor.clear

      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var items = ["Swim With Mike", "Lavalab", "USC Field Hockey", "SC Hackers", "Relay for Life"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.orgName.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.clear // make cell more visible in our example project
        
        cell.orgName.layer.cornerRadius = 20.0
        cell.orgName.layer.borderWidth = 5.0
        cell.orgName.layer.borderColor = UIColor.clear.cgColor
        cell.orgName.layer.masksToBounds = true
      
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}