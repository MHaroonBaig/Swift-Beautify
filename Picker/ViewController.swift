//
//  ViewController.swift
//  Picker
//
//  Created by Haroon on 04/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, SideBarDelegate{
    
    var sideBar:SideBar = SideBar()
    var rgbValues: [[Int]] = [[0], [0], [0]] // This contains the content of each row of a component. Each row is having numbers ranging from 0 to 255
    var switchTrigger: Bool = true
    
    var fontFamily = UIFont(name: "AppleSDGothicNeo-Light", size: 45.0)
    var currentSelection2:Int!
    
    
    var rgbBackground: [Int] = [255,255,255] // Populated by each component of a picker
    var backupRgbValues: [Int] = [46,204,113] //For Background RGB values when the switch state is changes
    var backupRgbValuesLabel: [Int] = [255,255,255] // For Label RGB values when the switch state is changed
    
    var pickerColor: UIColor = UIColor(red: 46/255.0 + (46/255.0)/3.0, green: 204/255.0 + (204/255.0)/3.0, blue: 113/255.0 + (113/255.0)/3.0, alpha: 0.5)
    var backgroundColor: UIColor = UIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1.0)
    var textColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    var bgString: String = "" // This is to set the Background RGB label text
    var message2: String = " " //Just a handful string to house all the integer rgb values by converting them into a String
    var bgString2: String = "" // For housing the text color once the switching is done
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myLabelRgb: UILabel! // Text RGB value
    
    @IBAction func switchStateChanged(sender: UISwitch) {
        if (sender.on){
            
            // The user is changing the color of the label
            for i in 0...2{
                myPicker.selectRow(backupRgbValuesLabel[i], inComponent:i, animated: true)
                rgbBackground[i] = backupRgbValuesLabel[i] //So that the color starts changing from the previously selected color after the user switches
            }
        } else {
            switchTrigger = false
            // The user is going to change the color of the Background
            for i in 0...2{
                myPicker.selectRow(backupRgbValues[i], inComponent:i, animated: true)
                rgbBackground[i] = backupRgbValues[i] // Loading the prevously selected values to start changing from there
            }
        }
    }
    
    @IBOutlet weak var myLabel: UILabel! // Lorem Ipsum Label
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myBgLabel: UILabel! // Background RGB Label
    
    // -------- Data source ----------------------------------------------------------//
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // How many components are there in the picker view ?
        return rgbValues.count;
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
            // How many rows are there in each component.
            var getCount = rgbValues[component].count
            return getCount
    }
    
    // -------- Delegates -------------------------------------------------------------//
    
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String! {
            // What is there in each row of a component?
            return String(rgbValues[component][row])
    }
    
    func pickerView(pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int) {
            
            // What would happen if the user selects a value?
            rgbBackground[component] = rgbValues[component][row] // Populating the array which contains the current RGB values
            
            // Convert the RGB values to Strings.
            for i in 0...2{
                message2 += String(rgbBackground[i])
                message2 += " "
            }
            
            // Divided by 255.0 because the min and max values are 0 and 1.0 in the UIColor class.
            var red_col: CGFloat = CGFloat(rgbBackground[0])/255.0
            var green_col: CGFloat = CGFloat(rgbBackground[1])/255.0
            var blue_col: CGFloat = CGFloat(rgbBackground[2])/255.0
            var bgColor = UIColor(red: red_col, green: green_col, blue: blue_col, alpha: 1.0)
            
            // If the switch is ON, we change the label color.
            if mySwitch.on{
                backupRgbValuesLabel[component] = rgbValues[component][row]
                myLabel.textColor = bgColor
                myLabelRgb.textColor = bgColor
                myBgLabel.textColor = bgColor
                textColor = bgColor
                //bgString2 = "Text RGB is " + message2
            }
            else {
                backupRgbValues[component] = rgbValues[component][row]
                self.view.backgroundColor = bgColor
                backgroundColor = bgColor
                
                if (rgbBackground[0] < 50 && rgbBackground[1] < 50 && rgbBackground[2] < 50){
                    /*
                    The background is too dark when RGB values are below 50, so something has to be done to make the
                    picker view visible
                    */
                    red_col += 50.0/255.0
                    green_col += 50.0/255.0
                    red_col += 50.0/255.0
                    pickerColor = UIColor(red: red_col + 3*red_col, green: 3*green_col + green_col, blue: blue_col + 3*blue_col, alpha: 0.3)
                    
                    myPicker.backgroundColor = pickerColor
                } else {
                    pickerColor = UIColor(red: red_col + red_col/3.0, green: green_col + green_col/3.0, blue: blue_col + blue_col/3.0, alpha: 0.5)
                    myPicker.backgroundColor =    pickerColor
                }
            }
            
    }
    func sideBarDidSelectButtonAtIndex(index: Int) {
        
        switch (index){
        case 0:
            self.view.backgroundColor = colorWithHexString("1abc9c")
            break
        case 1:
            self.view.backgroundColor = colorWithHexString("16a085")
            break
        case 2:
            self.view.backgroundColor = colorWithHexString("2ecc71")
            break
        case 3:
            self.view.backgroundColor = colorWithHexString("27ae60")
            break
        case 4:
            self.view.backgroundColor = colorWithHexString("3498db")
            break
        case 5:
            self.view.backgroundColor = colorWithHexString("2980b9")
            break
        case 6:
            self.view.backgroundColor = colorWithHexString("9b59b6")
            break
        case 7:
            self.view.backgroundColor = colorWithHexString("8e44ad")
            break
        case 8:
            self.view.backgroundColor = colorWithHexString("34495e")
            break
        case 9:
            self.view.backgroundColor = colorWithHexString("2c3e50")
            break
        case 10:
            self.view.backgroundColor = colorWithHexString("f1c40f")
            break
        case 11:
            self.view.backgroundColor = colorWithHexString("f39c12")
            break
        case 12:
            self.view.backgroundColor = colorWithHexString("e67e22")
            break
        case 13:
            self.view.backgroundColor = colorWithHexString("d35400")
            break
        case 14:
            self.view.backgroundColor = colorWithHexString("e74c3c")
            break
        case 15:
            self.view.backgroundColor = colorWithHexString("c0392b")
            break
        case 16:
            self.view.backgroundColor = colorWithHexString("ecf0f1")
            break
        case 17:
            self.view.backgroundColor = colorWithHexString("bdc3c7")
            break
        case 18:
            self.view.backgroundColor = colorWithHexString("95a5a6")
            break
        case 19:
            self.view.backgroundColor = colorWithHexString("7f8c8d")
            break
        case 20:
            self.view.backgroundColor = colorWithHexString("AEA8D3")
            break
        case 21:
            self.view.backgroundColor = colorWithHexString("DCC6E0")
            break
        default:
            
            break
        }
    }
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = (cString as NSString).substringToIndex(2)
        var gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        var bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        //SweetAlert().showAlert("\(r)")
        
        if (!mySwitch.on){
            rgbBackground[0] = Int(r)
            rgbBackground[1] = Int(g)
            rgbBackground[2] = Int(b)
            backupRgbValues = rgbBackground
            for i in 0...2{
                myPicker.selectRow(rgbBackground[i], inComponent: i, animated: true)
            }
        }
        
        var finalConvertedColor = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
        var red = CGFloat(r) / 255.0
        var green = CGFloat(g) / 255.0
        var blue  = CGFloat(b) / 255.0
        
        pickerColor = UIColor(red: red + red/3.0, green: green + green/3.0, blue: blue + blue/3.0, alpha: 0.5)
        myPicker.backgroundColor = pickerColor
        backgroundColor = finalConvertedColor
        
        return finalConvertedColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        myLabel.font = fontFamily
        myLabel.textColor = textColor
        myLabelRgb.textColor = textColor
        myBgLabel.textColor = textColor
        myPicker.backgroundColor = pickerColor
        self.view.backgroundColor = backgroundColor
        
        // Populating the RGB values
              
        var index = 0
        for i in 1...255{
            rgbValues[index].append(i)
            rgbValues[index + 1].append(i)
            rgbValues[index + 2].append(i)
            index = 0
        }
        
       
        for i in 0...2{
            myPicker.selectRow(backupRgbValues[i], inComponent:i, animated: true)
            rgbBackground[i] = backupRgbValues[i]
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sideBar = SideBar(sourceView: self.view, menuItems: ["Turquoise", "Greensea", "Emerland", "Nephritis", "Peterriver", "Belizehole", "Amethyst", "Wisteria", "Wetasphalt", "Midnightblue", "Sunflower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos", "Wistful", "Snuff"])
        sideBar.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "doneView"){
            var navigationToDoneView = segue.destinationViewController as DoneViewController
            navigationToDoneView.finalBackgroundColor = backgroundColor
            navigationToDoneView.finalLabelColor = textColor
            navigationToDoneView.finalLabelFont = fontFamily
        }
        else {
            var navigationObject: FontStylingsViewController = segue.destinationViewController as FontStylingsViewController
            navigationObject.pickerBackground2 = pickerColor
            navigationObject.labelBackgroundColor = textColor
            navigationObject.backgroundColor2 = backgroundColor
            navigationObject.backupRgbValues2 = backupRgbValues
            navigationObject.backupRgbValuesLabel2 = backupRgbValuesLabel
            navigationObject.currentSelection = currentSelection2
        }
    }
    
}

