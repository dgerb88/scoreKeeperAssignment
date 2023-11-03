//
//  PlayerTableViewController.swift
//  ScoreKeeper
//
//  Created by Dax Gerber on 11/2/23.
//

import UIKit

class PlayerTableViewController: UITableViewController {

    var players = PlayerController.shared.players
    var indexSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func minusButtonPushed(_ sender: Any) {
        players[indexSelected].score -= 1
        players = players.sorted { $0 < $1 }
        tableView.reloadData()
    }
    @IBAction func plusButtonPushed(_ sender: Any) {
        players[indexSelected].score += 1
        players = players.sorted { $0 < $1 }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scores", for: indexPath) as! PlayerTableViewCell
        cell.update(with: players[indexPath.row])
        
        // Configure the cell...

        return cell
    }
    
    @IBSegueAction func segue(_ coder: NSCoder, sender: Any?) -> AddEditViewController? {
        return AddEditViewController(coder: coder)
    }
    
    
    @IBAction func unwindToPlayerTableView(_ unwindSegue: UIStoryboardSegue) {
        guard let viewController = unwindSegue.source as? AddEditViewController, let player = viewController.player else { return }
        players.append(player)
        players = players.sorted { $0 < $1 }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        indexSelected = indexPath.row
        return indexPath
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // Override to support rearranging the table view.
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
