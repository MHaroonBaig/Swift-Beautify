//
//  FontStylingsViewController.swift
//  Picker
//
//  Created by Haroon on 13/11/2014.
//  Copyright (c) 2014 Haroon. All rights reserved.
//

import UIKit

class FontStylingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data: [[String]] = [[""], [""], ["Regular", "Bold", "Italic"]]
    var willProcessData: [String] = ["", "1", ""]
    
    
    @IBOutlet weak var myPickerView2: UIPickerView!
    @IBOutlet weak var myHeadingLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myThirdLabel: UILabel!
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return data[component][row]
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
        var fontNames: [String] = [""]
       
        for i in fontFamilies{
            var fontNamesForFamilies = UIFont.fontNamesForFamilyName(i as String)
            for j in fontNamesForFamilies{
                fontNames.append(j as String)
            }
        }
        data[0] = fontNames
       var fontSizes: [String] = [""]
        for i in 1...fontNames.count{
            fontSizes.append(String(i))
        }
        data[1] = fontSizes
        
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
