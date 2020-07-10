//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ishan Sharma on 10/07/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    var total : Float = 0.0;
    var split : Int = 1;
    var tip : Float = 0.0;
    var bill : Float = 0.0;

    override func viewDidLoad()
    {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = 10;
        resultLabel.text = String(format : "$ %.2f", total);
        summaryLabel.text = "Spliting $\(bill) between \(split) people, with \(Int(tip*100))% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil);
    }
}
