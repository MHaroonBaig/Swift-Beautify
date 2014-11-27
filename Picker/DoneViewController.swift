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

class DoneViewController: UIViewController, UIAlertViewDelegate{
    
    var alertButtonColor: UIColor!
    var finalLabelColor:UIColor!
    var finalBackgroundColor: UIColor!
    var finalLabelFont: UIFont!
    var finalValueMessage: String!
    //var donateButton: MKButton!
    
    
    @IBOutlet weak var myAddButton: UIButton!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var mylabel: UILabel!
    
    @IBAction func addName(sender: AnyObject) {
        var alert: UIAlertView!
        alert = UIAlertView(title: "Hi mate", message: "Please Enter Your Name", delegate: self, cancelButtonTitle: "Done")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        var username = alertView.textFieldAtIndex(0)?.text!
        let finalUsername = username! as NSString
        
        if finalUsername.length > 1 {
            let defaults = NSUserDefaults()
            defaults.setObject(username, forKey: "name")
            defaults.synchronize()
        }
    }
    
    @IBOutlet weak var aboutButton: UIButton!
    @IBAction func aboutView(sender: AnyObject) {
        var aboutMe: String = "Hi folks. I'm haroon, a slash coder and a techie guy digging deep into various new tech-related stuff with great enthusiasm to try new gadgets. I usually spend a lot of time coding in Python and Swift, configuring Linux and exploring Django.\n\nEmail: haroon.prog@gmail.com\nTwitter: @PyBaig\n\nHappy coding"
        SweetAlert().showAlert("Hi There!", subTitle: aboutMe, style: AlertStyle.CustomImag(imageFile: "myPic.png"), buttonTitle: "Got it", buttonColor: alertButtonColor, action: nil)
    }
    @IBAction func valuesRetrieval(sender: AnyObject) {
        
        var alert = SweetAlert()
        alert.setColor(finalBackgroundColor)
        alert.showAlert("Your Values", subTitle: "\(finalValueMessage)", style: AlertStyle.Success, buttonTitle: "Got it", buttonColor: alertButtonColor, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = finalBackgroundColor
        mylabel.textColor = finalLabelColor
        mylabel.font = finalLabelFont
        
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
        
        var backgroundString: String = "Background color: (\(backgroundRed), \(backgroundGreen), \(backgroundBlue))"
        var labelString: String = "Text color: (\(labelRed), \(labelGreen), \(labelBlue))"
        var fontName = "Awesome Font: "+finalLabelFont.fontName
        
        finalValueMessage = "\(backgroundString)\n\(labelString)\n\(fontName)\n\n*Color values are in RGB"
        myAddButton.tintColor = finalLabelColor
        
        // MARK: - Donate Button
        
        var donateButton = MKButton(frame: CGRect(x: 10.0, y: 10.0, width: 180.0, height: 45.0))
        donateButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(donateButton)
        
        donateButton.addTarget(self, action: "donateAction:", forControlEvents: UIControlEvents.TouchUpInside)
        donateButton.backgroundColor = finalBackgroundColor
        donateButton.layer.shadowOpacity = 0.85
        donateButton.layer.shadowRadius = 14.5
        donateButton.layer.shadowColor = finalLabelColor.CGColor
        donateButton.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        
        donateButton.setTitle("Donate", forState: .Normal)
        donateButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 22.0)
        var viewsDict = ["donateButton": donateButton]
        
        // MARK: - Constraints
        let width = NSLayoutConstraint.constraintsWithVisualFormat("V:[donateButton(45)]", options: nil, metrics: nil, views: viewsDict)
        let height = NSLayoutConstraint.constraintsWithVisualFormat("H:[donateButton(180)]", options: nil, metrics: nil, views: viewsDict)
        let position_X = NSLayoutConstraint(item: donateButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let position_Y = NSLayoutConstraint(item: donateButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.83, constant: 0.0)
        
        donateButton.addConstraints(width)
        donateButton.addConstraints(height)
        self.view.addConstraint(position_X)
        self.view.addConstraint(position_Y)
    }
    
    func donateAction(sender: UIButton!){
        var customIcon = UIImage(named: "lightbulb")
        var alertview = JSSAlertView().show(self, title: "Lovely", text: "We will start accepting your donations in the near future. This feature is currently unavailable", buttonText: "Ok", color: finalBackgroundColor, iconImage: customIcon)
        alertview.setTextTheme(.Light)
    
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        let getDefault = NSUserDefaults()
        let name = getDefault.objectForKey("name") as NSString!
        
        if let username = name {
            myNameLabel.textColor = finalLabelColor
            myNameLabel.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 45.0)
            myNameLabel.fadeOut(completion: { (Bool) -> Void in
                self.myNameLabel.text = "Good choice " + username + " !"
                self.myNameLabel.fadeIn(completion:{(Bool) -> Void in self.myNameLabel.fadeOut()
                })
            })
        }
        
        mylabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.mylabel.text = "Lorem Ipsum Dolor"
            self.mylabel.fadeIn()
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
