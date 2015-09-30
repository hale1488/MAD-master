//
//  ViewController.swift
//  Lab 3
//
//  Created by hayley leibson on 9/24/15.
//  Copyright (c) 2015 Hayley Leibson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var travelamount: UITextField!
    @IBOutlet weak var percentamount: UITextField!
    @IBOutlet weak var fairy: UITextField!
    @IBOutlet weak var percentdue: UILabel!
    @IBOutlet weak var totaldue: UILabel!
    @IBOutlet weak var totalpp: UILabel!

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateTipTotals() {
        let amount = (travelamount.text as NSString).floatValue
        let pct = (percentamount.text as NSString).floatValue/100
        let numberOfPeople=fairy.text.toInt() //returns an optional
        let tip=amount*pct
        let total=amount+tip
        var personTotal : Float = 0.0
        if numberOfPeople != nil {
            if numberOfPeople! > 0 {
                personTotal = total / Float(numberOfPeople!)
            }
            
            else {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "The number of fairies must be greater than 0", preferredStyle: UIAlertControllerStyle.Alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                    self.fairy.text="1"
                    self.updateTipTotals()
                })
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            } //end else
            
        }
        var currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle=NSNumberFormatterStyle.CurrencyStyle
        percentdue.text=currencyFormatter.stringFromNumber(tip)
        totaldue.text=currencyFormatter.stringFromNumber(total)
        
        totalpp.text=currencyFormatter.stringFromNumber(personTotal)
    }

    override func viewDidLoad() {
        travelamount.delegate=self
        percentamount.delegate=self
        fairy.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    func textFieldDidEndEditing(textField: UITextField) {
        updateTipTotals()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}



