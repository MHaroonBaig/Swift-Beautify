//
//  FontStylingsViewController.swift
//  Picker
//
//  Created by Haroon on 13/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class FontStylingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data: [String] = []
    var currentSelection:Int = 6
    
    
    var pickerBackground2:UIColor!
    var labelBackgroundColor: UIColor!
    var backgroundColor2: UIColor!
    
    @IBOutlet weak var myPickerView2: UIPickerView!
    @IBOutlet weak var myHeadingLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myThirdLabel: UILabel!
    
    @IBAction func doneView(sender: AnyObject) {
        
        var alert = UIAlertView(title: "Hello", message: "You pressed me", delegate: nil, cancelButtonTitle: "okay")
        alert.show()
    }
    var backupRgbValues2: [Int] = [255,255,255] //For Background RGB values when the switch state is changes
    var backupRgbValuesLabel2: [Int] = [255,255,255] // For Label RGB values when the switch state is changed
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(pickerView: UIPickerView,
        attributedTitleForRow row: Int,
        forComponent component: Int) -> NSAttributedString? {
            var para = NSMutableParagraphStyle()
            para.alignment = NSTextAlignment.Left
            var attributedString = NSAttributedString(string: data[row], attributes: [NSParagraphStyleAttributeName: para])
            return attributedString
    }
    
    func pickerView(pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int) {
            
            myHeadingLabel.font = UIFont(name: data[row], size: 45.0 )
            currentSelection = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var fontFamilies = UIFont.familyNames()
        var fontNames: [String] = []
        
        for i in fontFamilies{
            var fontNamesForFamilies = UIFont.fontNamesForFamilyName(i as String)
            for j in fontNamesForFamilies{
                fontNames.append(j as String)
            }
        }
        
        data = fontNames
        
        myPickerView2.backgroundColor = pickerBackground2
        myHeadingLabel.textColor = labelBackgroundColor
        self.view.backgroundColor = backgroundColor2
        myHeadingLabel.font = UIFont(name: data[currentSelection], size: 45.0 )
        myPickerView2.selectRow(currentSelection, inComponent: 0, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var navigatingBack: ViewController = segue.destinationViewController as ViewController
        navigatingBack.fontFamily = UIFont(name: data[currentSelection], size: 45.0)
        navigatingBack.textColor = labelBackgroundColor
        navigatingBack.pickerColor = pickerBackground2
        navigatingBack.backgroundColor = backgroundColor2
        navigatingBack.backupRgbValues = backupRgbValues2
        navigatingBack.backupRgbValuesLabel = backupRgbValuesLabel2
        navigatingBack.switchTrigger = false
        navigatingBack.currentSelection2 = currentSelection
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
