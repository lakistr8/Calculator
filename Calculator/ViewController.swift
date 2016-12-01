//
//  ViewController.swift
//  Calculator
//
//  Created by iosakademija on 12/1/16.
//  Copyright © 2016 iosakademija. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var digitButtons : [UIButton]!
    @IBOutlet var operatorButtons : [UIButton]!
    @IBOutlet weak var decimalButton : UIButton!
    @IBOutlet weak var changeSingButton : UIButton!
    @IBOutlet weak var clearButton : UIButton!
    @IBOutlet weak var deleteButton : UIButton!
    @IBOutlet weak var resultField : UITextField!
    
    var originalBackgorundColor : UIColor?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    let formatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    enum AritmeticOperation {
        case none
        case add, subtract, multiply, divide, percent, exponent2, exponent3, exponentX, sqrt
        case equal
    }
    var activeOperation = AritmeticOperation.none
    
    var firsOperand = 0.0
    var secondOperand = 0.0
   
}

typealias Internal = ViewController
extension Internal {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assingButtonTargets()
        configureDecimalButton()
    }
}

extension ViewController {
    
    func validateOperandInput() -> Double? {
        guard let numString = resultField.text else {
            return nil
        }
        
        let formatter = NumberFormatter()
        let numb = formatter.number(from: numString)?.doubleValue
        return numb
    }
}


extension ViewController {
    
    
    func assingButtonTargets() {
        let allButtons = [clearButton] + digitButtons + operatorButtons + [changeSingButton]
        for btn in allButtons {
            btn.addTarget(self,
                          action: #selector(ViewController.didTouchButton(_:)), for: .touchDown)
            
            btn.addTarget(self,
                          action: #selector(ViewController.didUntouchButton(_:)), for: .touchCancel)
            btn.addTarget(self,
                          action: #selector(ViewController.didUntouchButton(_:)), for: .touchUpOutside)
            
        }
    }
    func configureDecimalButton() {
        let local = NSLocale.current
        guard let decimalSing = local.decimalSeparator else { return }
        decimalButton.setTitle(decimalSing, for: .normal)
        
    }
    func didTouchButton(_ sender: UIButton) {
        originalBackgorundColor = sender.backgroundColor
        
        guard let _ = sender.backgroundColor else {
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        
        var a : CGFloat = 0.2
        
        guard let _ = sender.backgroundColor?.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        
        sender.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a*2)
    }
    
    func didUntouchButton(_ sender: UIButton) {
        sender.backgroundColor = originalBackgorundColor
        originalBackgorundColor = nil
        
    }
    
    @IBAction func didTapDigit(_ sender: UIButton) {
        
        defer {
            self.didUntouchButton(sender)
        }
        
        guard let numString =  sender.title(for: .normal) else { return }
        var value = resultField.text ?? ""
        
        if sender === decimalButton {
            
            if value.contains(numString) {
                return
            }
        }
        
        value += numString
        resultField.text = value
    }
    
    @IBAction func didTapAllClear(_ sender: UIButton) {
        activeOperation = .none
        resultField.text = nil
        firsOperand = 0
        secondOperand = 0
        
        self.didUntouchButton(sender)
        
    }
    
    @IBAction func didTapSingChange(_ sender: UIButton) {
        defer {
            self.didUntouchButton(sender)
        }
        
        guard let numb = validateOperandInput() else {
            resultField.text = nil
            return
        }
        firsOperand = numb
        let opr = numb * (-1)
        resultField.text = String(opr)
    }
    
    @IBAction func deleteButtonTapped(_ sender:UIButton) {
        defer {
            self.didUntouchButton(sender)
        }
        var value = resultField.text ?? ""
        guard value.characters.count > 0 else { return }
        var chars = value.characters
        chars.removeLast()
        resultField.text = String(chars)
    }
}
