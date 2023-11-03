//
//  PlayerTableViewCell.swift
//  ScoreKeeper
//
//  Created by Dax Gerber on 11/2/23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func update(with player: Player) {
        nameLabel.text = player.name
        scoreLabel.text = "Score: \(player.score)"
    }
    
    
}
