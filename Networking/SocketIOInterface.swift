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
            let dataArray2 = dataArray[0] as! NSArray

            for entry in dataArray2
            {
                let player = entry as! NSDictionary

                print(player)

                let id = player["id"] as! String?
                label.text = id
            }

            //let dataDictionary = dataArray2[0] as! NSDictionary



            //print(dataDictionary)
        }

        socket.connect()
        socket.emit("new player")
    }
}
