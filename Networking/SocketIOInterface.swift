//
//  SocketIOInterface.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/10/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation
import SocketIO

public class SocketIOInterface
{
    //let manager = SocketManager(socketURL: URL(string: "http://localhost:8888")!)
    let manager = SocketManager(socketURL: URL(string: "https://socketio20180530062155.azurewebsites.net")!)

    public func SendMessageToServer(label: UILabel)
    {
        let socket = manager.defaultSocket

        socket.on("connect") { data, ack in
            print("Connect just happened")
        }

        socket.on("state") { data, ack in

            let dataArray = data as NSArray
            let players = dataArray[0] as! NSDictionary

            for (key, value) in players
            {
                let socketId = key as! String
                print("Socket id:" + socketId)

                let playerPosition = value as! NSDictionary
                let x = playerPosition["x"] as! Int32
                let y = playerPosition["y"] as! Int32

                print("x:" + String(x))
                print("y:" + String(y))
            }
        }

        socket.connect()
        socket.emit("new player")
    }
}
