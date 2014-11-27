//
//  SideBarTableViewController.swift
//  BlurrySideBar
//
//  Created by Training on 01/09/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit


protocol SideBarTableViewControllerDelegate{
    func sideBarControlDidSelectRow(indexPath:NSIndexPath)
}

class SideBarTableViewController: UITableViewController {
    
    var delegate:SideBarTableViewControllerDelegate?
    var tableData:Array<String> = []
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            // Configure the cell...
            
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel.textColor = UIColor.darkTextColor()
            
            let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
        }
        
        cell!.textLabel.text = tableData[indexPath.row]
        var value = tableData[indexPath.row]
        switch (value){
        case "Turquoise":
            cell!.backgroundColor = UIColor(red: 0.102, green: 0.737, blue: 0.612, alpha: 1.0)
            break
        case "Greensea":
            cell!.backgroundColor = UIColor(red:0.086, green:0.627, blue:0.522, alpha:1)
            break
        case "Emerland":
            cell!.backgroundColor = colorWithHexString("2ecc71")
            break
        case "Nephritis":
            cell!.backgroundColor = colorWithHexString("27ae60")
            break
        case "Peterriver":
            cell!.backgroundColor = colorWithHexString("3498db")
            break
        case "Belizehole":
            cell!.backgroundColor = colorWithHexString("2980b9")
            break
        case "Amethyst":
            cell!.backgroundColor = colorWithHexString("9b59b6")
            break
        case "Wisteria":
            cell!.backgroundColor = colorWithHexString("8e44ad")
            break
        case "Wetasphalt":
            cell!.backgroundColor = colorWithHexString("34495e")
            break
        case "Midnightblue":
            cell!.backgroundColor = colorWithHexString("2c3e50")
            break
        case "Sunflower":
            cell!.backgroundColor = colorWithHexString("f1c40f")
            break
        case "Orange":
            cell!.backgroundColor = colorWithHexString("f39c12")
            break
        case "Carrot":
            cell!.backgroundColor = colorWithHexString("e67e22")
            break
        case "Pumpkin":
            cell!.backgroundColor = colorWithHexString("d35400")
            break
        case "Alizarin":
            cell!.backgroundColor = colorWithHexString("e74c3c")
            break
        case "Pomegranate":
            cell!.backgroundColor = colorWithHexString("c0392b")
            break
        case "Clouds":
            cell!.backgroundColor = colorWithHexString("ecf0f1")
            break
        case "Silver":
            cell!.backgroundColor = colorWithHexString("bdc3c7")
            break
        case "Concrete":
            cell!.backgroundColor = colorWithHexString("95a5a6")
            break
        case "Asbestos":
            cell!.backgroundColor = colorWithHexString("7f8c8d")
            break
        case "Wistful":
            cell!.backgroundColor = colorWithHexString("AEA8D3")
            break
        case "Snuff":
            cell!.backgroundColor = colorWithHexString("DCC6E0")
            break
        default:
            cell!.backgroundColor = UIColor.clearColor()
            break
        }
        
        return cell!
        
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
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.sideBarControlDidSelectRow(indexPath)
    }
    
    
    
}
