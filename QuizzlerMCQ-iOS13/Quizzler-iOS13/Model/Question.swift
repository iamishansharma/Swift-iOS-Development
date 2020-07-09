//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ishan Sharma on 09/07/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question
{
    let text : String;
    let options : [String];
    let cA : String;

    init(q: String, a: [String], correctAnswer : String)
    {
        text = q;
        options = a;
        cA = correctAnswer;
    }
}
