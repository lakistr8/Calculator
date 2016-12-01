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
    
   
}

typealias Internal = ViewController
extension Internal {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController {
    
    
    
    func didTouchButton(_ sender: UIButton) {
        originalBackgorundColor = sender.backgroundColor
        
        guard let _ = sender.backgroundColor else {
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        //	od buttona su vec pozadine providne
        //	moramo povecati alpha deo da bi se videlo na dodiru
        
        //	ovo je nacin da se izvuce RGBA komponente iz UIColor
        //	setup default (black)
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        //	koristimo 20% vidljivosti
        var a : CGFloat = 0.2
        //	pomocu ovog metoda cemo popuniti komponente UIColor vrednosti
        guard let _ = sender.backgroundColor?.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            //	ако екстракција не успе, онда се врати на црно, као горе
            sender.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            return
        }
        //	ako je uspelo koristimo alpha 2X
        sender.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a*2)
    }
    
    func didUntouchButton(_ sender: UIButton) {
        sender.backgroundColor = originalBackgroundColor
        originalBackgroundColor = nil
        
    }


    
}
