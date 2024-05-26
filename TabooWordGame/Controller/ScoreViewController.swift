//
//  ScoreViewController.swift
//  TabooWordGame
//
//  Created by Batu on 15.05.2024.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let score = score {
            scoreLabel.text = "\(score)"
        }
        
        // Do any additional setup after loading the view.
    }		
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toRestart", sender: nil)
        
        
    }
    
    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
    
}
