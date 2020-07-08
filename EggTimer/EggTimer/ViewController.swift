//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    let eggTimes = ["Soft":10, "Medium":15, "Hard":20];
    var secondsRemaining = 60;
    @IBOutlet weak var displayTime: UILabel!
    var player: AVAudioPlayer?
    var timer = Timer();
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TopLabel: UILabel!
    var hardness = "XYZ";

    @IBAction func eggPressed(_ sender: UIButton)
    {
        timer.invalidate();
        progressBar.progress = 0.0;
        hardness = sender.currentTitle!

        secondsRemaining = eggTimes[hardness]!;
        TopLabel.text = hardness;

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer()
    {
        if secondsRemaining > 0
        {
            //print("\(secondsRemaining) seconds.");
            displayTime.text = "\(secondsRemaining)";
            progressBar.progress = Float(eggTimes[hardness]! - secondsRemaining) / Float(eggTimes[hardness]!);
            secondsRemaining -= 1;
        }

        if secondsRemaining == 0
        {
            displayTime.text = "Your Eggs are done!";
            playSound();
            progressBar.progress = 1.0;
            timer.invalidate();
        }
    }

    func playSound()
    {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
