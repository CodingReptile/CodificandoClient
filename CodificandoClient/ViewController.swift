//
//  ViewController.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 5/18/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var networkClient: NetworkClient = NetworkClient()
    private var socketIOinterface: SocketIOInterface = SocketIOInterface()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var connect: UIButton!


    @IBAction func CreateConnection(_ sender: UIButton) {
        //self.networkClient.InitializeConnection()
        //self.networkClient.WriteToStream()

        self.socketIOinterface.SendMessageToServer(label: self.label)
    }
    
}

