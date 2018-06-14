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
    //let manager = SocketManager(socketURL: URL(string: "http://localhost")!)
    let manager = SocketManager(socketURL: URL(string: "https://socketio20180530062155.azurewebsites.net")!)

    public func SendMessageToServer()
    {
        let socket = manager.defaultSocket

        socket.on("connect") { data, ack in
            print("Connect just happened")
        }

        socket.on("state") { data, ack in
            print(data)
        }
        socket.connect()
        socket.emit("new player")
    }
}
