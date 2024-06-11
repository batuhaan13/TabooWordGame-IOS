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

        
    }
    
    
    

    @IBAction func mainMenuButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainMenu", sender: nil)
    }
    

}
