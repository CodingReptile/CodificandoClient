//
//  Game.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/16/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

class Game
{
    private var socketIOinterface: SocketIOInterface
    public private(set) var players: [Player]

    init()
    {
        players = [Player]()
        socketIOinterface = SocketIOInterface()
    }

    func ConnectToServer(gameName: String, playerData: NewPlayerData)
    {
        socketIOinterface.StartCommunication(callBackFunction: ProcessServerChanges, namespace: Configuration.GameNamespacePrefix + gameName, playerData: playerData)
    }

    func ProcessServerChanges(players: [Player]) -> Void
    {
        self.players = players

        for player in players
        {
            print(player)
        }
    }
}
