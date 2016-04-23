//
//  BaseService.swift
//  TrackMe
//
//  Created by Carson Holoien on 4/22/16.
//  Copyright © 2016 Carson Holoien/ Lauren Dumapias. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://trackmesb.firebaseio.com"

let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: Firebase
{
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    
    return currentUser!
}