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
    
    @IBOutlet weak var redScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var redScore: Int?
    var score: Int?
    var currentTour: Int = 0
    var totalTours: Int = 0
    weak var delegate: ScoreViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let score = score {
            scoreLabel.text = "\(score)"
        }
        if let redScore = redScore {
            redScoreLabel.text = "\(redScore)"
        }
    }
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        currentTour += 1
        if currentTour <= totalTours {
            delegate?.didContinueToNextRound()
            delegate?.restartTimer()
            delegate?.restartProgress()
            dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true) {
                self.delegate?.didContinueToNextRound()
                self.delegate?.restartTimer()
                self.delegate?.restartProgress()
            }
        }
    }
    
    
    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
    
}
