//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ishan Sharma on 09/07/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain
{
    var bmi : BMI?

    mutating func calculateBMI(_ h: Float, _ w: Float)
    {
        if(h == 0)
        {
            bmi?.value = 0.0;
        }
        else
        {
            let bmiVal = w / (h * h);

            if bmiVal < 18.5
            {
                bmi = BMI(value: bmiVal, advice: "Eat some fat bro!", color: #colorLiteral(red: 1, green: 0.9569, blue: 0.3765, alpha: 1));
            }
            else if bmiVal < 24.5
            {
                bmi = BMI(value: bmiVal, advice: "Keep this health up!", color: #colorLiteral(red: 0.5647, green: 0.898, blue: 0.5294, alpha: 1));
            }
            else
            {
                bmi = BMI(value: bmiVal, advice: "Reduce some weight bro!", color: #colorLiteral(red: 1, green: 0.5882, blue: 0.5882, alpha: 1));
            }
        }
    }

    func getBMI() -> String
    {
        let bmiValue = String(format : "%.1f", bmi?.value ?? 0.0);
        return bmiValue;
    }

    func getAdvice() -> String
    {
        return bmi?.advice ?? "No advice";
    }

    func getColor() -> UIColor
    {
        return bmi?.color ?? UIColor.white;
    }
}
