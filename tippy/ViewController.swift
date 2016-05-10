//
//  ViewController.swift
//  tippy
//
//  Created by Sampo Karjalainen on 5/5/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAndTotalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipAndTotalView.alpha = 0
        billField.frame.origin.y = 130
        tipAndTotalView.frame.origin.y = 140
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if (bill) == 0 {
            UIView.animateWithDuration(0.2, animations: {
                self.tipAndTotalView.alpha = 0
                self.billField.frame.origin.y = 100
                self.tipAndTotalView.frame.origin.y = 140
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.tipAndTotalView.alpha = 1
                self.billField.frame.origin.y = 35
                self.tipAndTotalView.frame.origin.y = 122
            })
        }
        
    }

}

