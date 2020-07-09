//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    var story = StoryBrain();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        storyLabel.text = story.getText();
        choice1Button.setTitle(story.getChoice(1), for: .normal);
        choice2Button.setTitle(story.getChoice(2), for: .normal);
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        if sender.currentTitle == story.getChoice(1)
        {
            updateUI(1);
        }
        else
        {
            updateUI(2);
        }
    }

    func updateUI(_ op : Int)
    {
        story.changeStoryNumber(op);
        storyLabel.text = story.getText();
        choice1Button.setTitle(story.getChoice(1), for: .normal);
        choice2Button.setTitle(story.getChoice(2), for: .normal);
    }
}
