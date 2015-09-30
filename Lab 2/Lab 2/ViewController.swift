//
//  ViewController.swift
//  Lab 2
//
//  Created by hayley leibson on 9/20/15.
//  Copyright (c) 2015 Hayley Leibson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var elephantimage: UIImageView!

    @IBAction func changeinfo(sender: UISegmentedControl) {
        if imagecontrol.selectedSegmentIndex==0 {
            titlelabel.text="First, the elephant blushed because he saw a beautiful flower!"
            elephantimage.image=UIImage(named: "elephant")
        }
        else if imagecontrol.selectedSegmentIndex==1 {
            titlelabel.text="Then the elephant sneezed, and was embarrased so he turned pink!"
            elephantimage.image=UIImage(named: "elephant2")
        }
        
    }
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var imagecontrol: UISegmentedControl!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var fontsizelabel: UILabel!
    @IBAction func changefontsize(sender: UISlider) {
        let fontSize=sender.value
        fontsizelabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titlelabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
    }
}

