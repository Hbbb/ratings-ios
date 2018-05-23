//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Harrison Borges on 5/21/18.
//  Copyright © 2018 steezydanks. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
  var players = SampleData.generatePlayerData()

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell

    cell.player = players[indexPath.row]

    return cell
  }
}

extension PlayersViewController {
  @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {}
  
  @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
      let player = playerDetailsViewController.player else { return }
    
    players.append(player)
    
    let indexPath = IndexPath(row: players.count - 1, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
  }
}
