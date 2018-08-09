//
//  GameViewController.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 8/7/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    public var gameDescription : GameDescription?
    public var playerData: NewPlayerData?

    private var game = Game()

    @IBAction func CreateConnection(_ sender: UIButton) {
        //self.networkClient.InitializeConnection()
        //self.networkClient.WriteToStream()

        guard let gameName = gameDescription?.name else
        {
            print("Could not connect to game")
            return
        }

        game.ConnectToServer(gameName: gameName, playerData: playerData!)
    }
}
