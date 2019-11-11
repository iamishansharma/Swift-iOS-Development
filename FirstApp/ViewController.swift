//
//  ViewController.swift
//  FirstApp
//
//  Created by Ishan Sharma on 12/11/19.
//  Copyright © 2019 Ishan Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label2: UILabel!

    @IBAction func button(_ sender: Any)
    {
        label2.text="Hi, Hello " + textfield.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

