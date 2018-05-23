//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Harrison Borges on 5/21/18.
//  Copyright © 2018 steezydanks. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var ratingPicker: UIPickerView!
  
  var ratingData: [String] = SampleData.generateRatings()
  var rating: Int = 1
  var player: Player?
  
  var game: String = "Fortnite" {
    didSet {
      detailLabel.text = game
    }
  }
  
  override func viewDidLoad() {
    ratingPicker.delegate = self
    ratingPicker.dataSource = self
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "SavePlayerDetail", let playerName = nameTextField.text {
      player = Player(name: playerName, game: game, rating: rating)
    }
    
    if segue.identifier == "PickGame",
      let gamePickerViewController = segue.destination as? GamePickerViewController {
      gamePickerViewController.selectedGame = game
    }
  }
}

// MARK: - UIPickerViewDataSource protocol
extension PlayerDetailsViewController {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return ratingData.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return ratingData[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    rating = row + 1
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
