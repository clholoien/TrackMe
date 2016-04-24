//
//  SettingsViewController.swift
//  TrackMe
//
//  Created by Carson Holoien on 4/23/16.
//  Copyright © 2016 Carson Holoien/ Lauren Dumapias. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var backToTrackViewButton: UIToolbar!
    
    let userRef = FIREBASE_REF.childByAppendingPath(CURRENT_USER.authData.uid)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userInfoRef = userRef.childByAppendingPath("user_info")
        
        userInfoRef.observeEventType(.Value, withBlock: { snapshot in
            
                self.firstNameTextField.text = snapshot.value.objectForKey("first_name") as! String!
                self.lastNameTextField.text = snapshot.value.objectForKey("last_name") as! String!
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
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

    @IBAction func saveChangesAction(sender: AnyObject) {
        let userInfo = ["first_name": firstNameTextField.text!, "last_name": lastNameTextField.text!]
        let userInfoRef = userRef.childByAppendingPath("user_info")

        userInfoRef.setValue(userInfo)
    }
}
