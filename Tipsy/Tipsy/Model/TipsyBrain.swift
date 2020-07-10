//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Ishan Sharma on 10/07/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct tipsy
{
    var bill : String = "0.0";
    var split : Int = 1;
    var tip : Float = 0.0;
    var billamt : Float = 0.0;

    mutating func getResult() -> Float
    {
        billamt = Float(bill) ?? 0.0;
        let num = (billamt) * (1 + tip);
        return  num / (Float(split));
    }
}
