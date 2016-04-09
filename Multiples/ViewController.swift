//
//  ViewController.swift
//  Multiples
//
//  Created by Thomas Woodfield on 9/04/16.
//  Copyright © 2016 Thomas Woodfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        enterMultiple.keyboardType = UIKeyboardType.NumberPad
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    var multiple: Int = 0
    var total: Int = 0
    var howManyTimes = 0
    
    @IBOutlet weak var mainTitle: UIImageView!
    @IBOutlet weak var enterMultiple: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addingLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func onBackButtonPressed(sender: AnyObject) {
        enterMultiple.text = ""
        mainTitle.hidden = false
        enterMultiple.hidden = false
        playButton.hidden = false
        addButton.hidden = true
        addingLabel.hidden = true
        backButton.hidden = true
        total = 0
        howManyTimes = 0
    }
    @IBAction func buttonPressed(sender: UIButton) {
        if enterMultiple.text != nil && enterMultiple.text != "" {
            mainTitle.hidden = true
            enterMultiple.hidden = true
            playButton.hidden = true
            addButton.hidden = false
            addingLabel.hidden = false
            backButton.hidden = false
            total = 0
            howManyTimes = 0
            multiple = Int(enterMultiple.text!)!
            updateLabel()
            
        }
        
    }
    
    @IBAction func addPressed(sender: UIButton) {
        total = total+multiple
        updateLabel()
    }
    func updateLabel() {
        howManyTimes++
        total = howManyTimes * multiple
        addingLabel.text = "\(howManyTimes) x \(multiple) = \(total)"
    }
    
} 