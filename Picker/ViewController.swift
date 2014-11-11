//
//  ViewController.swift
//  Picker
//
//  Created by Haroon on 04/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var rgbValues: [[Int]] = [[0], [0], [0]] // This contains the content of each row of a component. Each row is having numbers ranging from 0 to 255
    var switchTrigger: Bool = true
    
    var rgbBackground: [Int] = [255,255,255] // Populated by each component of a picker
    var backupRgbValues: [Int] = [255,255,255] //For Background RGB values when the switch state is changes
    var backupRgbValuesLabel: [Int] = [255,255,255] // For Label RGB values when the switch state is changed
    
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
            var txtColor = UIColor(red: 1.0 - red_col, green: 1 - green_col, blue: 1 - blue_col, alpha: 1.0) // Varying color according to the background to make the Text visible
            
            // If the switch is ON, we change the label color.
            if mySwitch.on{
                backupRgbValuesLabel[component] = rgbValues[component][row]
                myLabel.textColor = bgColor
                myLabelRgb.textColor = bgColor
                myBgLabel.textColor = bgColor
                bgString2 = "Text RGB is " + message2
            }
            else {
                backupRgbValues[component] = rgbValues[component][row]
                self.view.backgroundColor = bgColor
                
                // If the user has selected a text color and comes back to the background selection, his selection for the text remains the same.
                if (switchTrigger){
                    myLabel.textColor = txtColor // Main Label
                    myLabelRgb.textColor = txtColor // Label showing RGB values for the main label
                    myBgLabel.textColor = txtColor // Label showing RGB values for the background
                }
                
                bgString = "Background RGB is" + message2
                
                if (rgbBackground[0] < 50 && rgbBackground[1] < 50 && rgbBackground[2] < 50){
                    /*
                    The background is too dark when RGB values are below 50, so something has to be done to make the
                    picker view visible
                    */
                    red_col += 50.0/255.0
                    green_col += 50.0/255.0
                    red_col += 50.0/255.0
                    
                    myPicker.backgroundColor = UIColor(red: red_col + 3*red_col, green: 3*green_col + green_col, blue: blue_col + 3*blue_col, alpha: 0.3)
                } else {
                    myPicker.backgroundColor = UIColor(red: red_col + red_col/3.0, green: green_col + green_col/3.0, blue: blue_col + blue_col/3.0, alpha: 0.5)
                }
            }
            
            myBgLabel.text = bgString
            myLabelRgb.text = bgString2
            message2 = " " // Or else, it will add up the previous values
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        
        // Populating the RGB values
        for counter in 0...2{
            for i in 1...255{
                rgbValues[counter].append(i)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

