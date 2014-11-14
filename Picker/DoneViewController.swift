//
//  DoneViewController.swift
//  Picker
//
//  Created by Haroon on 14/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    var finalLabelColor:UIColor!
    var finalBackgroundColor: UIColor!
    var finalLabelFont: UIFont!
    
    @IBOutlet weak var mylabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = finalBackgroundColor
        mylabel.textColor = finalLabelColor
        mylabel.font = finalLabelFont
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
    
}
