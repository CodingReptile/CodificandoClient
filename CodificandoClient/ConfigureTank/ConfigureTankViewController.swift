//
//  ConfigureTankViewController.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/17/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class ConfigureTankViewController: UIViewController {

    private static let MAX_VALUE = 100

    private var totalCount: Int = 0
    private var attackCount: Int = 0
    private var defenseCount: Int = 0
    private var speedCount: Int = 0

    @IBOutlet weak var totalCountLabel: UILabel!

    @IBOutlet weak var attackSlider: UISlider!

    @IBOutlet weak var defenseSlider: UISlider!

    @IBOutlet weak var speedSlider: UISlider!

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalCountLabel.text = "Total: \(self.totalCount)/\(ConfigureTankViewController.MAX_VALUE)"

        attackSlider.minimumValue = 0
        attackSlider.maximumValue = 100

        defenseSlider.minimumValue = 0
        defenseSlider.maximumValue = 100

        speedSlider.minimumValue = 0
        speedSlider.maximumValue = 100
    }

    @IBAction func ProcessChangeInSlider(_ sender: UISlider) {
        if sender == attackSlider
        {
            attackCount = Int(attackSlider.value)

            let reminder = ConfigureTankViewController.MAX_VALUE - attackCount - defenseCount - speedCount
            if reminder <= 0
            {
                attackCount = attackCount + reminder
            }
        }
        else if sender == defenseSlider
        {
            defenseCount = Int(defenseSlider.value)

            let reminder = ConfigureTankViewController.MAX_VALUE - attackCount - defenseCount - speedCount
            if reminder <= 0
            {
                defenseCount = defenseCount + reminder
            }
        }
        else if sender == speedSlider
        {
            speedCount = Int(speedSlider.value)

            let reminder = ConfigureTankViewController.MAX_VALUE - attackCount - defenseCount - speedCount
            if reminder <= 0
            {
                speedCount = speedCount + reminder
            }
        }

        attackSlider.setValue(Float(attackCount), animated: true)
        defenseSlider.setValue(Float(defenseCount), animated: true)
        speedSlider.setValue(Float(speedCount), animated: true)
        totalCount = attackCount + defenseCount + speedCount

        self.UpdateCountLabel()
    }

    private func UpdateCountLabel()
    {
        totalCountLabel.text = "Total: \(self.totalCount)/\(ConfigureTankViewController.MAX_VALUE)"
    }

    @IBAction func ConfigureTank(_ sender: UIButton) {
        if (self.ValidatePlayerData())
        {
            performSegue(withIdentifier: "Show Lobby", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? LobbyTableViewController
        {
            let playerData = NewPlayerData(name: nameTextField.text!, speed: speedCount, attack: attackCount, defense: defenseCount)
            dest.playerData = playerData
        }
    }

    private func ValidatePlayerData() -> Bool
    {
        if (self.attackCount + self.speedCount + self.defenseCount != 100)
        {
            return false
        }

        guard let name = nameTextField.text else
        {
            return false
        }

        if name.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
        {
            return false
        }

        return true
    }

}
