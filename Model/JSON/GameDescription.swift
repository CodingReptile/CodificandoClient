//
//  GameDescription.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 8/6/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

//
// Structures to be used for communication with server
//
public struct GameDescription : Codable
{
    let state: Int
    let name: String
    let maxNumberOfPlayers: Int
    let players: [String:Player]
    let nsp: String?

    struct Player : Codable
    {
        let state : PlayerState
        let id: String
        let name: String
        let x: Int
        let y: Int
    }

    enum PlayerState : String, Codable
    {
        case Waiting
        case Playing
        case Destroyed
        case Pinging
    }
}
