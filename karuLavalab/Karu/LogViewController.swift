//
//  LogViewController.swift
//  Karu
//
//  Created by John Zeiders on 4/23/18.
//  Created by Caroline Chocholak on 4/23/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit
import Firebase

class LogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var teamCountLabel: UILabel!
    var items: [String] = ["Lavalab", "USC Field Hockey",
                                   "Mureality"]
    var itemHours: [String: String] = ["Lavalab": "8/10 Hours", "USC Field Hockey": "4/5 Hours",
        "Mureality": "2/8 Hours"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let displayName = user?.displayName
        
        getTeamInfo()
        
        nameLabel.text = displayName
        
        
        // Do any additional setup after loading the view.
    }
    fileprivate func getTeamInfo() {
        let user = Auth.auth().currentUser
        let uid = user!.uid
        let teamsRef = Firestore.firestore().collection("Teams")
        let query = teamsRef.whereField("users.\(uid)", isEqualTo: true)
        query.getDocuments {(querysnapshot, err) in
            if let err = err {
                print("Error getting docs: \(err)")
            } else {
                self.setTeamCount(querySnapshot: querysnapshot!)
            }
        }
    }
    func setTeamCount(querySnapshot: QuerySnapshot) {
        self.teamCountLabel.text = (String(querySnapshot.count) + "\n Teams")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = itemHours[items[indexPath.row]]
        cell.detailTextLabel?.textColor = UIColor.white
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1.5
        cell.layer.cornerRadius = 5.0
        
        return cell
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
