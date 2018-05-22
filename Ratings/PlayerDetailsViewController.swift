//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Harrison Borges on 5/21/18.
//  Copyright © 2018 steezydanks. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
  
  var player: Player?
  
  var game: String = "Fortnite" {
    didSet {
      detailLabel.text = game
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "SavePlayerDetail", let playerName = nameTextField.text {
      player = Player(name: playerName, game: "New Game", rating: 2)
    }
  }
}

// MARK: - IBActions
extension PlayerDetailsViewController {
  @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
    if let gamePickerViewController = segue.source as? GamePickerViewController,
      let selectedGame = gamePickerViewController.selectedGame {
      game = selectedGame
    }
  }
}

extension PlayerDetailsViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
      nameTextField.becomeFirstResponder()
    }
  }
}
