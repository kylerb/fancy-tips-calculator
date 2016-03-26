//
//  ViewController.swift
//  fancy-tips-calculator
//
//  Created by Kyler Blue on 3/21/16.
//  Copyright © 2016 Kyler Blue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tippercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twopersonsLabel: UILabel!
    @IBOutlet weak var threepersonsLabel: UILabel!
    @IBOutlet weak var fourpersonsLabel: UILabel!
    @IBOutlet weak var greenBottomView: UIView!
    var roundedValue: Double!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tippercentageLabel.text = "15%"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twopersonsLabel.text = "$0.00"
        threepersonsLabel.text = "$0.00"
        fourpersonsLabel.text = "$0.00"
        roundedValue = 15
        self.greenBottomView.alpha = 0
        self.tipSlider.alpha = 0
        self.tippercentageLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: UITextField) {
        
        let billFieldNoDollar = billField.text!.stringByReplacingOccurrencesOfString("$", withString: "")
        let billAmount = NSString(string: billFieldNoDollar).doubleValue
        let tip = billAmount * (roundedValue / 100)
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twopersonsLabel.text = String(format: "$%.2f", (total / 2))
        threepersonsLabel.text = String(format: "$%.2f", (total / 3))
        fourpersonsLabel.text = String(format: "$%.2f", (total / 4))
  
        if billFieldNoDollar.characters.count != 0 {
            print ("bill field has characters")
            self.greenBottomView.fadeIn()
            self.tipSlider.fadeIn()
            self.tippercentageLabel.fadeIn()
            }
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        NSLog("%f", sender.value)
        let step: Double = 1.0
        
        roundedValue = round(Double(sender.value) / step) * step
        sender.value = Float(roundedValue)
        tippercentageLabel.text = "\(Int(roundedValue))%"
        
        let billFieldNoDollar = billField.text!.stringByReplacingOccurrencesOfString("$", withString: "")
        let billAmount = NSString(string: billFieldNoDollar).doubleValue
        let tip = billAmount * (roundedValue / 100)
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twopersonsLabel.text = String(format: "$%.2f", (total / 2))
        threepersonsLabel.text = String(format: "$%.2f", (total / 3))
        fourpersonsLabel.text = String(format: "$%.2f", (total / 4))
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

