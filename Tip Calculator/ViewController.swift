//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Andrew Duck on 19/2/16.
//  Copyright © 2016 Andrew Duck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabelSplit1: UILabel!
    @IBOutlet weak var tipLabelSplit2: UILabel!
    @IBOutlet weak var tipLabelSplit3: UILabel!
    @IBOutlet weak var tipLabelSplit4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.text = 0.twoDigits
        
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        tipLabelSplit1.text = "0.00"
        tipLabelSplit2.text = "0.00"
        tipLabelSplit3.text = "0.00"
        tipLabelSplit4.text = "0.00"
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        // Setup inital vars
        _ = NSLocale.currentLocale()
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        // Update billField
        billField.text = (Double((billField.text?.numbersOnly.integerValue)!) / 100).twoDigits
        
        // Setup tip percentages and map to tipControl
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]


        let billAmount = formatter.numberFromString((Double((billField.text?.numbersOnly.integerValue)!) / 100).twoDigits)?.doubleValue
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip
        let tipSplit2 = total / 2
        let tipSplit3 = total / 3
        let tipSplit4 = total / 4
        
        // Fix display of results to use appropriate currency code from NSNumberFormatter
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        tipLabelSplit1.text = formatter.stringFromNumber(total)
        tipLabelSplit2.text = formatter.stringFromNumber(tipSplit2)
        tipLabelSplit3.text = formatter.stringFromNumber(tipSplit3)
        tipLabelSplit4.text = formatter.stringFromNumber(tipSplit4)
        

    }
    

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
extension Double {
    struct Number {
        static let formatter: NSNumberFormatter = {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }()
    }
    var twoDigits: String {
        return Number.formatter.stringFromNumber(self) ?? ""
    }
}
extension String {
    var numbersOnly: String {
        return componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).joinWithSeparator("")
    }
    var integerValue: Int {
        return Int(self) ?? 0
    }
}


