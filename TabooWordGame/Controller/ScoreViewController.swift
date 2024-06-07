//
//  ScoreViewController.swift
//  TabooWordGame
//
//  Created by Batu on 15.05.2024.
//

import UIKit

protocol ScoreViewControllerDelegate: AnyObject {
    func didContinueToNextRound()
    func restartTimer() 
    func restartProgress()
}   

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int?
    var currentTour: Int = 0
    var totalTours: Int = 0
    weak var delegate: ScoreViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let score = score {
            scoreLabel.text = "\(score)"
        }
    }
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        currentTour += 1
        if currentTour < totalTours {
            scoreLabel.text = "\(currentTour)/\(totalTours)"
            delegate?.didContinueToNextRound()
            
        } else {
            performSegue(withIdentifier: "toRestart", sender: nil)
        
        }
        delegate?.restartTimer()
        delegate?.restartProgress()
    }
    
    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
}
