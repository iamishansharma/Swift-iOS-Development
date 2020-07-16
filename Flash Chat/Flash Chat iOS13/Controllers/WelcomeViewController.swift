//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Ishan Sharma on 21/10/2019.
//  Copyright © 2020 Ishan Sharma. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad();
        registerButton.layer.cornerRadius = 30;
        loginButton.layer.cornerRadius = 30;

        animate();
    }

    func animate()
    {
        let titleText = "⚡️FlashChat";
        titleLabel.text = "";
        var charIndex = 0;
        for letter in titleText
        {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false)
            {
                (timer) in
                self.titleLabel.text?.append(letter);
            }
            charIndex += 1;
        }
    }

    @IBAction func registerPressed(_ sender: UIButton)
    {

    }

    @IBAction func loginPressed(_ sender: UIButton)
    {

    }
}
