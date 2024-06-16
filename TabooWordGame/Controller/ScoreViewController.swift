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
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    
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
            
            currentLabel.text = showCurrentScore()
        }
        func showCurrentScore() -> String {
            guard let score = score, let redScore = redScore else {
                return "="
            }
            if redScore > score {
                currentScore.text = "Kırmızı Takım önde!"
                currentScore.textColor = .systemRed
                return ">"
            } else if redScore < score {
                currentScore.text = "Mavi Takım önde!"
                currentScore.textColor = .tintColor
                return "<"
            } else {
                currentScore.text = "Tur berabere!"
                currentScore.textColor = .gray
                return "="
            }
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
        
        let alertButton = UIAlertController(title: "Ana menüye dön?", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "toMainMenu", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Hayır", style: .cancel)
        alertButton.addAction(alertAction)
        alertButton.addAction(cancelAction)
        present(alertButton, animated: true)
        
    }
    
    
}
