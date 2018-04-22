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
    
    
    
    var currY: Int = 0
    @IBOutlet weak var eventButtonView: UIView!
    
    @IBOutlet weak var buttonScroll: UIScrollView!
    
    let reuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
    
       eventScrollView.backgroundColor = UIColor.clear
        eventScrollView.allowsMultipleSelection = false
        
        let button = UIButton(type: UIButtonType.system) as UIButton
       
        button.backgroundColor = .green
        button.titleLabel?.text = "Hello"
       
        currY = 0
         eventButtonView.addSubview(makeButtonWithText(text: "Indie Button"))
        eventButtonView.addSubview(makeButtonWithText(text: "Test"))
        eventButtonView.addSubview(makeButtonWithText(text: "Another"))
        //myButton = button
                    // change tag property
       // self.view.addSubview(myButton) // add to view as subview
        self.buttonScroll.addSubview(button)
      

        // Do any additional setup after loading the view.
    }

    func makeButtonWithText(text:String) -> UIButton {
        let myButton = UIButton(type: UIButtonType.system)
        //Set a frame for the button. Ignored in AutoLayout/ Stack Views
        myButton.frame = CGRect(x: 0, y: currY, width: 308, height: 155)
        
        
        myButton.layer.cornerRadius = 5
        //Set background color
        myButton.backgroundColor = UIColor.blue
        
        myButton.showsTouchWhenHighlighted = true
        //myButton.setTitleColor(<#T##color: UIColor?##UIColor?#>, for: [])
        
        
        myButton.contentHorizontalAlignment = .left
        
        myButton.titleEdgeInsets = UIEdgeInsetsMake(100, 10, 0, 0)
        let label = UILabelPadding(frame: CGRect(x: 0, y: currY, width: 220, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        label.text = text
        myButton.addSubview(label)
        
       // let leadingConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: myButton.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 20)
        //let trailingConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: myButton.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 100)
        //label.addConstraint(leadingConstraint)
       // label.addConstraint(trailingConstraint)
       // label.centerXAnchor.anchorWithOffset(to: <#T##NSLayoutXAxisAnchor#>)
        label.leftAnchor.constraint(equalTo: myButton.leftAnchor, constant: 20.0).isActive = true
        //label.centerXAnchor.constraint(equalTo: myButton.leftAnchor.anchorWithOffset(to: <#T##NSLayoutXAxisAnchor#>)).isActive = true
        label.bottomAnchor.constraint(equalTo: myButton.bottomAnchor, constant: -20.0).isActive = true
        //label.centerYAnchor.constraint(equalTo: myButton.topAnchor).isActive = true
       
        myButton.addTarget(self,
                           action: #selector(helloButton),
                           for: .touchUpInside
        )
        currY += 170
        return myButton
    }
    
    @IBAction func helloButton(sender:UIButton){
        self.performSegue(withIdentifier: "toEventSegue", sender: self)
    }
    var items = ["Swim With Mike", "Lavalab", "USC Field Hockey", "SC Hackers", "Relay for Life"]
    

    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    var selectedIndex = Int ()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.orgName.text = self.items[indexPath.item]
       
        //cell.orgName.backgroundColor = UIColor.clear
        
        cell.backgroundColor = UIColor.white
        cell.alpha = 0.4
        cell.orgName.backgroundColor = UIColor.clear
        cell.orgName.alpha = 1
        cell.orgName.textColor = UIColor.black
        
        
        
        
        
        
        return cell
      
      
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedIndex = indexPath.row
        //eventScrollView.reloadData();
        
        
       
    }

}
