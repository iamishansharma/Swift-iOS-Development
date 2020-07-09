//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController
{
    var bmiValue : String!

    var calculatorBrain = CalculatorBrain();

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    override func viewDidLoad()
    {
        super.viewDidLoad();
    }
    @IBAction func heightSliderChange(_ sender: UISlider)
    {
        heightLabel.text = String(format : "%.2f m", sender.value);
    }
    @IBAction func weightSliderChange(_ sender: UISlider)
    {
        weightLabel.text = String(format : "%d kg",Int(sender.value));
    }

    @IBAction func calculatePressed(_ sender: UIButton)
    {
        let height = heightSlider.value;
        let weight = weightSlider.value;

        calculatorBrain.calculateBMI(height, weight);

        self.performSegue(withIdentifier: "GoToResults", sender: self);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToResults"
        {
            let destinationVC = segue.destination as! ResultViewController;
            destinationVC.bmiValue = calculatorBrain.getBMI();
            destinationVC.advice = calculatorBrain.getAdvice();
            destinationVC.color = calculatorBrain.getColor();
        }
    }
}

