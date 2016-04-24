//
//  AddTrackingViewController.swift
//  TrackMe
//
//  Created by Carson Holoien on 4/23/16.
//  Copyright © 2016 Carson Holoien/ Lauren Dumapias. All rights reserved.
//

import UIKit
import Firebase

class AddTrackingViewController: UIViewController {

    
    @IBOutlet weak var trackingNumberTextField: UITextField!
    @IBOutlet weak var nameOfPackageTextField: UITextField!
    
    @IBOutlet weak var cancelAddTrackingButton: UIBarButtonItem!
    
    var ref = Firebase(url: "https://docs-examples.firebaseio.com/web/saving-data/fireblog")
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func startTrackingAction(sender: AnyObject) {
        
        let newShipment = ["tracking_number": trackingNumberTextField.text!, "name_of_Package": nameOfPackageTextField.text!]
        
        //Add shipments to your tracking list
        let userRef = FIREBASE_REF.childByAppendingPath(CURRENT_USER.authData.uid)
        let userShipmentRef = userRef.childByAppendingPath("shipments")
        let shipmentVariable = userShipmentRef.childByAutoId()
        
        //Add shipping info to Firebase
        shipmentVariable.setValue(newShipment)
    }

}
