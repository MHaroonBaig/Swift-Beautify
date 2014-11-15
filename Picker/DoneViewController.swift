//
//  DoneViewController.swift
//  Picker
//
//  Created by Haroon on 14/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

extension UIView {
    func fadeIn(duration: NSTimeInterval = 1.5, delay: NSTimeInterval = 0.5, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 1.3, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}

class DoneViewController: UIViewController {
    
    
    var alertButtonColor: UIColor!
    var finalLabelColor:UIColor!
    var finalBackgroundColor: UIColor!
    var finalLabelFont: UIFont!
    var finalValueMessage: String!
    
    @IBOutlet weak var mylabel: UILabel!
    
    @IBOutlet weak var aboutButton: UIButton!
    @IBAction func aboutView(sender: AnyObject) {
        var aboutMe: String = "Hi folks. I'm haroon, a slash coder and a techie guy digging deep into various new tech-related stuff with great enthusiasm to try new gadgets. I usually spend a lot of time coding in Python and Swift, configuring Linux and exploring Django.\n\nEmail: haroon.prog@gmail.com\nTwitter: @PyBaig\n\nHappy coding"
        SweetAlert().showAlert("Hi There!", subTitle: aboutMe, style: AlertStyle.CustomImag(imageFile: "myPic.png"), buttonTitle: "Got it", buttonColor: alertButtonColor, action: nil)
    }
    @IBAction func valuesRetrieval(sender: AnyObject) {
        
        
        SweetAlert().showAlert("Your Values", subTitle: "\(finalValueMessage)", style: AlertStyle.Success, buttonTitle: "Got it", buttonColor: alertButtonColor, action: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = finalBackgroundColor
        mylabel.textColor = finalLabelColor
        mylabel.font = finalLabelFont
        mylabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.mylabel.text = "Lorem Ipsum"
            self.mylabel.fadeIn()
        })
        
        aboutButton.tintColor = finalLabelColor
        var labelColor: String = finalLabelColor.description
        var components = labelColor.componentsSeparatedByString(" ")
        var labelRed = Int (((components[1] as NSString).doubleValue) * 255.0)
        var labelGreen = Int (((components[2] as NSString).doubleValue) * 255.0)
        var labelBlue = Int (((components[3] as NSString).doubleValue) * 255.0)
        
        var backgroundColor: String = finalBackgroundColor.description
        components = backgroundColor.componentsSeparatedByString(" ")
        var backgroundRed = Int (((components[1] as NSString).doubleValue) * 255.0)
        var backgroundGreen = Int (((components[2] as NSString).doubleValue) * 255.0)
        var backgroundBlue = Int (((components[3] as NSString).doubleValue) * 255.0)
        
        if ( (backgroundRed > 180) && (backgroundGreen > 180) && (backgroundBlue > 180) ){
            alertButtonColor = UIColor(red: CGFloat(backgroundRed - 100)/255.0, green: CGFloat(backgroundGreen - 100)/255.0, blue: CGFloat(backgroundBlue - 100)/255.0, alpha: 1.0)
        }
        else {
            alertButtonColor = finalBackgroundColor
        }
        
        var backgroundString: String = "Background: (\(backgroundRed), \(backgroundGreen), \(backgroundBlue))"
        var labelString: String = "Text color: (\(labelRed), \(labelGreen), \(labelBlue))"
        var fontName = "Awesome Font: "+finalLabelFont.fontName
        
        finalValueMessage = "\(backgroundString)\n\(labelString)\n\(fontName)\n\n*Values are in RGB"

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
