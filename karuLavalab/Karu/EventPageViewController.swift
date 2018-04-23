//
//  EventPageViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/4/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase


class EventPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var eventScrollView: UICollectionView!
    
    
    
    var currY: Int = 0
    private var eventCollection: LocalCollection<Event>!
    private var teamCollection: LocalCollection<Team>!

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
        eventButtonView.addSubview(makeButtonWithText(text: "Swim with Mike"))
        eventButtonView.addSubview(makeButtonWithText(text: "Test"))
        eventButtonView.addSubview(makeButtonWithText(text: "Another"))
        //myButton = button
                    // change tag property
       // self.view.addSubview(myButton) // add to view as subview
<<<<<<< HEAD
        self.buttonScroll.addSubview(button)
        if(Auth.auth().currentUser == nil) {
            DispatchQueue.main.sync {
                Auth.auth().signIn(withEmail: "hello@gmail.com", password: "testtest")
            }
        }
        
        getEvents()
        getTeams()
=======
        //self.buttonScroll.addSubview(button)
      
>>>>>>> 0225617b4e3a56653c32c95767a53e5cf2f124d0

        // Do any additional setup after loading the view.
    }
    func getTeams() {
        if let u = Auth.auth().currentUser {
            let uid = u.uid
            let teamsRef = Firestore.firestore().collection("Teams")
            let query = teamsRef.whereField("users.\(uid)", isEqualTo: true)
            teamCollection = LocalCollection(query: query) {(changes) in
                
                print("Recieved Team Update")
            }
            teamCollection.listen()
        }
        
    }
    func getEvents() {
        if(teamCollection == nil) {
            return
        }
        let team =  teamCollection.documents[selectedIndex]
        let teamId = team.documentID
        let eventsRef = Firestore.firestore().collection("Events")
        let query = eventsRef.whereField("teamID", isEqualTo: teamId)
        eventCollection = LocalCollection(query: query) { (changes) in
            print("Received Update")
        }
        eventCollection.listen()
    }

    func makeButtonWithText(text:String) -> UIButton {
        let myButton = UIButton(type: UIButtonType.system)
        //Set a frame for the button. Ignored in AutoLayout/ Stack Views
        myButton.frame = CGRect(x: 0, y: currY, width: 308, height: 155)
        
        let charity = UIImage(named: "charity")
        
        myButton.layer.cornerRadius = 5
        //Set background color
        myButton.setBackgroundImage(charity, for: UIControlState.normal)
        myButton.tintColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 0.4)
        
        
        myButton.showsTouchWhenHighlighted = true
        
       let newImage = UIImage(named: "AvailableBanner")
        let image = UIImageView(image: newImage)
        
        myButton.addSubview(image)
        myButton.contentHorizontalAlignment = .left
       
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        //image.heightAnchor.constraint(equalToConstant: 83.0).isActive = true
        //image.widthAnchor.constraint(equalToConstant: 83.0).isActive = true
        image.leftAnchor.constraint(equalTo: myButton.leftAnchor, constant: -2.0).isActive = true
        image.topAnchor.constraint(equalTo: myButton.topAnchor, constant: -2.0).isActive = true

        myButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        myButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        myButton.layer.shadowOpacity = 0.3
        
       
        myButton.titleEdgeInsets = UIEdgeInsetsMake(100, 10, 0, 0)
        let label = UILabelPadding(frame: CGRect(x: 0, y: currY, width: 220, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 4.0
        label.alpha = 0.8
        label.layer.masksToBounds = true
        label.textColor = UIColor.black
        label.text = text
        myButton.addSubview(label)
        
      
        label.leftAnchor.constraint(equalTo: myButton.leftAnchor, constant: 2.0).isActive = true
       
        label.bottomAnchor.constraint(equalTo: myButton.bottomAnchor, constant: -20.0).isActive = true
       
       
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
    deinit {
        eventCollection.stopListening()
        teamCollection.stopListening()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    // The collection is the scroll bar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.teamCollection.count
    }
    
    // make a cell for each cell index path
    var selectedIndex = Int ()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.orgName.text = self.teamCollection[indexPath.item].name
       
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
        getEvents()
        //eventScrollView.reloadData();
        
        
       
    }

}
