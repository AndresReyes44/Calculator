//
//  ViewController.swift
//  Calculator
//
//  Created by user192432 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    var operation = ""
    var Result = false
    var num = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func processNumber(_ sender: UIButton) {
        //Process al the number entered
            if let numberText = sender.titleLabel?.text {
                if !Result{
                if (displayLabel.text == "0") {
                    displayLabel.text = numberText
                    
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                }
                } else {
                    displayLabel.text = numberText
                    Result = false
                }
            }
        }
    
    //The function that manage the operations
    func operrations(num1: Double, num2: Double, operation: String) -> Double{
        /*Resives the operation to work on, depending on what's sent it do the operation*/
        switch operation {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "X":
            return num1 * num2
        case "/":
            return num1 / num2
        case "%":
            return num1 / 100
        default:
            return num2
        }
        
    }
    
    //Manage the C button to clear all
    @IBAction func Clear(_ sender: UIButton){
        displayLabel.text = "0"
        num = "0"
        Result = true
        operation = ""
    }
    
    //Manage all the signs pressed
    @IBAction func processOperation(_ sender: UIButton) {
           if let operationText = sender.titleLabel?.text {
               if operation.isEmpty {
                   operation = operationText
                   num = displayLabel.text ?? "0"
                   Result = true
                   
               } else {
                let num1 = Double(num)
                let num2 = Double(displayLabel.text!)
                let result = operrations(num1: num1!, num2: num2!, operation: operation)
                displayLabel.text = String(result)
                num = "0"
                Result = true
                operation = ""
               }
           }
    }
    
    //Manage tue button with equals sign
    @IBAction func Equals(_ sender:UIButton){
        let num1 = Double(num)
        let num2 = Double(displayLabel.text!)
        let result = operrations(num1: num1!, num2: num2!, operation: operation)
        displayLabel.text = String(result)
        num = "0"
        Result = true
        operation = ""
    }
    

}

