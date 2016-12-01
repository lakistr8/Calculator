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
    
    
   
}

typealias Internal = ViewController
extension Internal {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
