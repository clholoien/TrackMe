//
//  TrackViewController.swift
//  TrackMe
//
//  Created by Carson Holoien on 4/23/16.
//  Copyright © 2016 Carson Holoien/ Lauren Dumapias. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var addTrackingButton: UIToolbar!
    @IBOutlet weak var settingsButton: UIToolbar!
    let userRef = FIREBASE_REF.childByAppendingPath(CURRENT_USER.authData.uid)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userShipmentsRef = userRef.childByAppendingPath("Shipments")
        
        userShipmentsRef.observeEventType(.Value, withBlock: { snapshot in
            snapshot
            
                }, withCancelBlock: { error in
                print(error.description)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logoutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        print("User has Logged off of TrackMe")
        performSegueWithIdentifier("logoutSegue", sender: self)
    }
}
