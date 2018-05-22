//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by Harrison Borges on 5/22/18.
//  Copyright © 2018 steezydanks. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
  var games = [
    "Angry Birds",
    "Space Invaders",
    "Donkey Kong",
    "Spin the Bottle",
    "Fortnite",
    "Star Fox 64"
  ]
  
  var selectedGameIndex: Int?
  
  var selectedGame: String? {
    didSet {
      if let selectedGame = selectedGame, let index = games.index(of: selectedGame) {
        selectedGameIndex = index
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "SaveSelectedGame",
      let cell = sender as? UITableViewCell,
      let indexPath = tableView.indexPath(for: cell) else { return }
    
    selectedGame = games[indexPath.row]
  }
}

extension GamePickerViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return games.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
    cell.textLabel?.text = games[indexPath.row]

    if indexPath.row == selectedGameIndex {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    
    return cell
  }
}

extension GamePickerViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    // clear the old selection
    if let index = selectedGameIndex {
      let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
      cell?.accessoryType = .none
    }
    
    // this will also automatically set the new selectedGameIndex
    selectedGame = games[indexPath.row]

    let cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .checkmark
  }
}















