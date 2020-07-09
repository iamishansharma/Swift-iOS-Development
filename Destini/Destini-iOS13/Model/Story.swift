//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story
{
    let t : String;
    let c1 : String;
    let c1d : Int;
    let c2 : String;
    let c2d : Int;

    init(title : String, choice1 : String, choice1Destination : Int, choice2 : String, choice2Destination : Int)
    {
        t = title;
        c1 = choice1;
        c1d = choice1Destination;
        c2 = choice2;
        c2d = choice2Destination
    }
}
