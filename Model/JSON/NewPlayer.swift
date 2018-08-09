//
//  NewPlayer.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 8/9/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation
import SocketIO

// Structure that defines schema for NewPlayer action
struct NewPlayerData : SocketData {

    let name: String
    let speed: Int
    let attack: Int
    let defense: Int

    func socketRepresentation() -> SocketData {
        return [
            "name": name,
            "speed": speed,
            "attack": attack,
            "defense": defense]
    }
}
