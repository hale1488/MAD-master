//
//  ViewController.swift
//  Project 1
//
//  Created by hayley leibson on 9/20/15.
//  Copyright (c) 2015 Hayley Leibson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var lineFields:[UITextField]!
    @IBOutlet weak var entry1: UITextField!
    @IBOutlet weak var entry2: UITextField!
    @IBOutlet weak var entry3: UITextField!
    @IBOutlet weak var entry4: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        entry1.delegate=self
        entry2.delegate=self
        entry3.delegate=self
        entry4.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    let filePath = self.dataFilePath()
    if (NSFileManager.defaultManager().fileExistsAtPath(filePath)) {
            let array = NSArray(contentsOfFile: filePath) as! [String]
            for var i = 0; i < array.count; i++ {
                lineFields[i].text = array[i]
            }
        }
        
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:",
            name: UIApplicationWillResignActiveNotification,
            object: app)
        }
        
        func applicationWillResignActive (notification: NSNotification) {
            let filePath = self.dataFilePath()
            let array = (self.lineFields as NSArray).valueForKey("text") as! NSArray
            array.writeToFile(filePath, atomically: true)
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = paths[0] as! NSString
        return documentsDirectory.stringByAppendingPathComponent("data.plist")
            as String
    }
    

}

//    func dataFilePath() -> String {
//        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
//            NSSearchPathDomainMask.UserDomainMask, true)
//        let documentsDirectory = paths[0] as! NSString
//        return documentsDirectory.stringByAppendingPathComponent("data.plist")
//        as String
//    }



