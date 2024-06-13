//
//  TotalScoreViewController.swift
//  TabooWordGame
//
//  Created by Batu on 11.06.2024.
//

import UIKit

class TotalScoreViewController: UIViewController {

    @IBOutlet weak var redScoreLabel: UILabel!
    @IBOutlet weak var blueScoreLabel: UILabel!
    @IBOutlet weak var resultTeamLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var totalBlueScore: Int?
    var totalRedScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let totalBlueScore = totalBlueScore {
            blueScoreLabel.text = "\(totalBlueScore)"
        }
        if let totalRedScore = totalRedScore {
            redScoreLabel.text = "\(totalRedScore)"
        }
        
        resultTeamLabel.text = getResultSign()
        
    }
    func getResultSign() -> String {
        guard let totalBlueScore = totalBlueScore, let totalRedScore = totalRedScore else {
            return "="
        }
        
        if totalRedScore > totalBlueScore {
            resultLabel.text = "Kırmızı Takım Kazandı!"
            return ">"
        } else if totalRedScore < totalBlueScore {
            resultLabel.text = "Mavi Takım Kazandı!"
            resultLabel.textColor = .tintColor
            return "<"
        } else {
            resultLabel.text = "Berabere!"
            resultLabel.textColor = .gray
            return "="
        }
        
    }

    @IBAction func mainMenuButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
    

}
