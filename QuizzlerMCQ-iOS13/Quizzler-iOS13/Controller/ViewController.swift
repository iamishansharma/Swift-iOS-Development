//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Ishan Sharma on 09/07/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!

    var quizBrain = QuizBrain();

    override func viewDidLoad()
    {
        super.viewDidLoad();
        updateUI();
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!;

        if quizBrain.checkAnswer(userAnswer)
        {
            sender.backgroundColor = UIColor.green;
        }
        else
        {
            sender.backgroundColor = UIColor.red;
        }

        quizBrain.updateQuestion();

        // adding 0.2s delay to clear colors
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI()
    {
        ProgressBar.progress = quizBrain.getProgress();

        QuestionLabel.text = quizBrain.getQuestionText();
        Option1.setTitle(quizBrain.getOption(1), for : .normal);
        Option2.setTitle(quizBrain.getOption(2), for : .normal);
        Option3.setTitle(quizBrain.getOption(3), for : .normal);

        Option1.backgroundColor = UIColor.clear;
        Option2.backgroundColor = UIColor.clear;
        Option3.backgroundColor = UIColor.clear;
        scoreLabel.text = "Score : " + quizBrain.getScore();
    }
}
