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
            if currentTour <= totalTours {
                delegate?.didContinueToNextRound()
                delegate?.restartTimer()
                delegate?.restartProgress()
                dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Oyun Bitti", message: "Tur sayısı doldu. Tekrar oynamak ister misiniz?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { [weak self] (_) in
                    self?.dismiss(animated: true, completion: nil)
                    self?.currentTour = 0
                    self?.delegate?.didContinueToNextRound()
                    self?.delegate?.restartTimer()
                    self?.delegate?.restartProgress()
                    self?.performSegue(withIdentifier: "toRestart", sender: nil)

                }))
                alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: { (_) in
                    self.performSegue(withIdentifier: "toRestart", sender: nil)
                }))
                present(alert, animated: true, completion: nil)
            }
        }
    
    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
}
