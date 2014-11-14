//
//  FontStylingsViewController.swift
//  Picker
//
//  Created by Haroon on 13/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class FontStylingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data: [[String]] = [[], []]
    var willProcessData: [String] = ["", "45", ""]
    
    var pickerBackground2:UIColor!
    var labelBackgrounfColor: UIColor!
    var backgroundColor2: UIColor!
    
    @IBOutlet weak var myPickerView2: UIPickerView!
    @IBOutlet weak var myHeadingLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myThirdLabel: UILabel!
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    
    func pickerView(pickerView: UIPickerView,
        attributedTitleForRow row: Int,
        forComponent component: Int) -> NSAttributedString? {
            var para = NSMutableParagraphStyle()
            para.alignment = NSTextAlignment.Left
            var attributedString = NSAttributedString(string: data[component][row], attributes: [NSParagraphStyleAttributeName: para])
            return attributedString
    }
    
    
    func pickerView(pickerView: UIPickerView,
        widthForComponent component: Int) -> CGFloat {
            if component == 0{
                return 255.0
            }
            else{
                return 35.0
            }
    }
    
    func pickerView(pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int) {
            willProcessData[component] = data[component][row]
            var someShit = willProcessData[1].toInt()
            
            myHeadingLabel.font = UIFont(name: willProcessData[0], size: CGFloat(someShit!) )
            
            
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
        data[0] = fontNames
        var fontSizes: [String] = []
        for i in 40...fontNames.count{
            fontSizes.append(String(i))
        }
        data[1] = fontSizes
        myPickerView2.backgroundColor = pickerBackground2
        myHeadingLabel.textColor = labelBackgrounfColor
        self.view.backgroundColor = backgroundColor2
        
        
        
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
