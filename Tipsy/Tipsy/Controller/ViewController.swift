//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var zeroPer: UIButton!
    @IBOutlet weak var tenPer: UIButton!
    @IBOutlet weak var fifPer: UIButton!
    @IBOutlet weak var twenPer: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    var tipsyBrain = tipsy();

    override func viewDidLoad()
    {
        super.viewDidLoad();
        calculateButton.layer.cornerRadius = 10;
        zeroPer.isSelected = true;
        stepper.value = 1;
    }

    @IBAction func tipPressed(_ sender: UIButton)
    {
        billTotal.endEditing(true);

        cleartip();

        if sender.currentTitle == "0%"
        {
            zeroPer.isSelected = true;
            tipsyBrain.tip = 0.0;
        }
        else if sender.currentTitle == "10%"
        {
            tenPer.isSelected = true;
            tipsyBrain.tip = 0.1;
        }
        else if sender.currentTitle == "15%"
        {
            fifPer.isSelected = true;
            tipsyBrain.tip = 0.15;
        }
        else
        {
            twenPer.isSelected = true;
            tipsyBrain.tip = 0.2;
        }
    }

    func cleartip()
    {
        zeroPer.isSelected = false;
        tenPer.isSelected = false;
        fifPer.isSelected = false;
        twenPer.isSelected = false;
    }

    @IBAction func splitPressed(_ sender: UIStepper)
    {
        splitLabel.text = String(Int(sender.value));
        tipsyBrain.split = Int(sender.value);
    }

    @IBAction func calculatePressed(_ sender: UIButton)
    {
        tipsyBrain.bill = billTotal.text ?? "0.0";

        self.performSegue(withIdentifier: "GoToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToResult"
        {
            let destVC = segue.destination as! ResultViewController;
            destVC.total = tipsyBrain.getResult();
            destVC.split = tipsyBrain.split;
            destVC.tip = tipsyBrain.tip;
            destVC.bill = tipsyBrain.billamt;
        }
    }
}
