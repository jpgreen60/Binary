//
//  ViewController.swift
//  Binary
//
//  Created by John Green on -06-192018.
//  Copyright © 2018 John P. Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueEntryTextField: UITextField!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    
    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Menlo", size: 36.0)!])
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        valueEntryTextField.attributedPlaceholder = placeholder
        valueEntryTextField.addTarget(self, action: #selector(textFieldTextDidChange), for: .editingChanged)
        disableBtns()
 
    }

    @objc func textFieldTextDidChange() {
        
        if valueEntryTextField.text == "" {
            disableBtns()
        } else {
            enableBtns()
        }
        
    }
    
    func disableBtns() {
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5
    }
    
    func enableBtns() {
        binaryBtn.isEnabled = true
        binaryBtn.alpha = 1.0
        decimalBtn.isEnabled = true
        decimalBtn.alpha = 1.0
    }
    
    
    @IBAction func binaryBtnWasPressed(_ sender: UIButton) {
        
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 1.0
            decimalBtn.alpha = 0.5
            guard let string = valueEntryTextField.text, let intFromString = Int(string) else { return }
            let binaryDigit = BinaryDecimal(intFromString)
            valueEntryTextField.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
        
    }
    
    @IBAction func decimalBtnWasPressed(_ sender: Any) {
        
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 0.5
            decimalBtn.alpha = 1.0
            guard let string = valueEntryTextField.text else { return }
            let bitsFromString = string.map { Int(String($0))! }
            let binaryDigit = BinaryDecimal(bitsFromString)
            valueEntryTextField.text = "\(binaryDigit.calculateIntValueForBinary())"
        }
        
    }
    
}

