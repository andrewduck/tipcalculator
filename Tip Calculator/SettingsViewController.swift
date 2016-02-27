//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Andrew Duck on 20/2/16.
//  Copyright © 2016 Andrew Duck. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        //let tipPercentages = [0.18, 0.2, 0.22]
        //let tipPercentage = tipPercentages[tipDefaultControl.selectedSegmentIndex]
        let tipDefault = tipDefaultControl.selectedSegmentIndex
        
        let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.setObject("defaultTipAmount", forKey: "defaultTipAmount"_)
        defaults.setInteger(tipDefault, forKey: "defaultTipAmount")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipControlIndex = defaults.integerForKey("defaultTipAmount")
        tipDefaultControl.selectedSegmentIndex = defaultTipControlIndex
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
