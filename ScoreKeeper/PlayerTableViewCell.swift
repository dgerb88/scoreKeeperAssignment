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
    @IBOutlet weak var stepperValue: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    var firstTime = true
    func update(with player: Player) {
        if firstTime {
            stepperValue.value = Double(player.score)
            firstTime = false
        }
        nameLabel.text = player.name
        scoreLabel.text = "Score: \(Int(stepperValue.value))"
    }
    
    
}
