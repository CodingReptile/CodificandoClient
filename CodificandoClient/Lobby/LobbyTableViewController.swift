//
//  LobbyTableViewController.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/20/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class LobbyTableViewController: UITableViewController {

    private var gameDescriptions : [GameDescription]?

    public var playerData: NewPlayerData?

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkHelper.GetListOfServerGames(execute: self.loadData)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let size = gameDescriptions?.count
        {
            return size
        }

        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameLobbyCell", for: indexPath)

        if let name = gameDescriptions?[indexPath.row].name
        {
            cell.textLabel?.text = name
        }

        if gameDescriptions == nil
        {
            cell.textLabel?.text = "Loading..."
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGame", sender: gameDescriptions![indexPath.row])
    }

    private func loadData(serverGames: [GameDescription])
    {
        self.gameDescriptions = serverGames
        self.tableView.reloadData()
    }

    @IBAction func refreshGames(_ sender: UIBarButtonItem) {
        NetworkHelper.GetListOfServerGames(execute: self.loadData)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameInfo = sender as? GameDescription,
            let gameViewController = segue.destination as? GameViewController
        {
            gameViewController.gameDescription = gameInfo
            gameViewController.playerData = self.playerData
        }
    }


}
