//
//  Player.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/16/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

class Player : CustomStringConvertible
{
    var description: String
    {
        return "Player '\(id)': x=\(x) y=\(y)";
    }

    var id: String
    var x : Int
    var y : Int

    init(id: String, x: Int, y:Int)
    {
        self.id = id
        self.x = x
        self.y = y
    }
}
