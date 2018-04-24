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
    private var settings: FirestoreSettings!
    private var db: Firestore!

    @IBOutlet weak var eventButtonView: UIView!
    
    @IBOutlet weak var buttonScroll: UIScrollView!
    
    let reuseIdentifier = "cell"
    override func viewDidLoad() {
        settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        db = Firestore.firestore()
        db.settings = settings
        super.viewDidLoad()
    
        eventScrollView.backgroundColor = UIColor.clear
        eventScrollView.allowsMultipleSelection = false
        
       
        currY = 0
        
        
        //myButton = button
                    // change tag property
       // self.view.addSubview(myButton) // add to view as subview

        if(Auth.auth().currentUser == nil) {
            DispatchQueue.main.sync {
                Auth.auth().signIn(withEmail: "hello@gmail.com", password: "testtest")
            }
        }
        
        getEvents()
        getTeams()


        // Do any additional setup after loading the view.
    }
    func makeScrollButton(text: String) -> UIButton {
        let button = UIButton(type: UIButtonType.system) as UIButton
        button.backgroundColor = .green
        button.titleLabel?.text = text
        return button
    }
    func getTeams() {
        if let u = Auth.auth().currentUser {
            let uid = u.uid
            let teamsRef = db.collection("Teams")
            print(uid)
            let query = teamsRef.whereField("users.\(uid)", isEqualTo: true)
            teamCollection = LocalCollection(query: query) {(changes) in
                self.eventScrollView.subviews.forEach({$0.removeFromSuperview()})
                print(self.teamCollection.count)
                print("Recieved Teams Update" )
                self.eventScrollView.reloadData();
                
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
        let eventsRef = db.collection("Events")
        let query = eventsRef.whereField("teamID", isEqualTo: teamId)
        eventCollection = LocalCollection(query: query) { (changes) in
            self.eventScrollView.subviews.forEach({$0.removeFromSuperview()})
            self.eventCollection.items.forEach({(event) in
                self.eventScrollView.addSubview(self.makeButtonWithText(event: event))
            })
            print("Received Events Update")
        }
        eventCollection.listen()
    }

    func makeButtonWithText(event:Event) -> UIButton {
        //Set a frame for the button. Ignored in AutoLayout/ Stack Views
        let myButton = EventButton(event: event)
        return myButton
    }
    
    func handleEventPressed(event: Event){
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

        cell.orgName.text = self.teamCollection.items[indexPath.item].name
        cell.orgName.highlightedTextColor = UIColor.white
        if indexPath.item == 0 {
            cell.layer.cornerRadius = 5.0
            cell.layer.masksToBounds = true
            cell.backgroundColor = UIColor.white
            cell.orgName.textColor = UIColor.white
            cell.orgName.alpha = 1
            cell.orgName.backgroundColor = UIColor(displayP3Red: 0/255.0, green: 187.0/255.0, blue: 100/255.0, alpha: 1.0)
            cell.alpha = 1.0
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
        else {
            cell.backgroundColor = UIColor.white
            cell.alpha = 0.4
            cell.orgName.backgroundColor = UIColor.clear
            cell.orgName.alpha = 1
            cell.orgName.textColor = UIColor.black
            cell.layer.cornerRadius = 5.0
            cell.layer.masksToBounds = true
            
        }
        cell.orgName.isUserInteractionEnabled = true

        return cell
      
      
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedIndex = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        cell.orgName.text = self.teamCollection.items[indexPath.item].name
        cell.orgName.text =  "HELLO!"
        cell.reloadInputViews()

        
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.alpha = 0.4
        cell.orgName.backgroundColor = UIColor.clear
        cell.orgName.alpha = 1
        cell.orgName.textColor = UIColor.black
        
    }

}
class EventButton : UIButton {
    var event: Event!
    var label: UILabelPadding!
    var currY: Int!
    required init(event: Event) {
        currY = 100
        self.event = event
        super.init(frame: CGRect(x: 0, y: 300, width: 308, height: 155))
        createImage()
        setStyle()
        createLabel()

        self.addTarget(self,
                       action: #selector(EventButton.clicked),
                       for: .touchUpInside)
        print("created a button")
        
    }
    func createImage() {
        let newImage = UIImage(named: "AvailableBanner")
        let image = UIImageView(image: newImage)
        
        self.addSubview(image)
        self.contentHorizontalAlignment = .left
        
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        //image.heightAnchor.constraint(equalToConstant: 83.0).isActive = true
        //image.widthAnchor.constraint(equalToConstant: 83.0).isActive = true
        image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -2.0).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: -2.0).isActive = true
    }
    func setStyle() {

        let charity = UIImage(named: "charity")
        
        self.layer.cornerRadius = 5
        //Set background color
        self.setBackgroundImage(charity, for: UIControlState.normal)
        self.tintColor = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 0.4)
        
        self.showsTouchWhenHighlighted = true
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.3
        
        
        self.titleEdgeInsets = UIEdgeInsetsMake(100, 10, 0, 0)
    }
    func createLabel() {
        label = UILabelPadding(frame: CGRect(x: 0, y: currY, width: 220, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 4.0
        label.alpha = 0.8
        label.layer.masksToBounds = true
        label.textColor = UIColor.black
        label.text = event.name
        self.addSubview(label)
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2.0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0).isActive = true
    }
    
    @objc func clicked() {
        print("EVENT CLICKED")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

