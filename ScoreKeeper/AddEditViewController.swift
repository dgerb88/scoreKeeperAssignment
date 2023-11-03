//
//  ViewController.swift
//  ScoreKeeper
//
//  Created by Dax Gerber on 11/2/23.
//

import UIKit

class AddEditViewController: UIViewController {
    
    var player: Player?

    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
    }
    
    @IBAction func Editing(_ sender: Any) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "filip" else { return }
        guard scoreTextField.text != nil else { return }
        guard nameTextField.text != nil else { return }
        let name = nameTextField.text!
        guard Int(scoreTextField.text!) != nil else { return }
        let score = Int(scoreTextField.text!)!
        player = Player(score: score, name: name)
    }
    func updateSaveButtonState() {
        if scoreTextField.text == nil || Int(scoreTextField.text!) == nil || nameTextField.text == nil {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }

    @IBOutlet weak var saveButton: UIButton!
}
