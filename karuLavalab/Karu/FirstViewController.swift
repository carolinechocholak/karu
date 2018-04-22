//
//  FirstViewController.swift
//  Karu
//
//  Created by Caroline Chocholak on 4/21/18.
//  Copyright © 2018 Caroline Chocholak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Logo.alpha = 0
        self.animate()
      //  let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      /*  let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BeginViewController") as! BeginViewController
        self.navigationController?.pushViewController(nextViewController, animated: true) */
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        

        // Do any additional setup after loading the view.
    }
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "begin", sender: self)
    }

    @IBOutlet weak var Logo: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func animate() {
        UIView.animate(withDuration: 1, animations: {
            self.Logo.alpha = 0
        }) { (finished) in
            self.fadeIn()
        }
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 1, animations: {
            self.Logo.alpha = 1
        }) { (finished) in
            self.fadeOut()
        }
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1, animations: {
            self.Logo.alpha = 0
           
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
