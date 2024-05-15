//
//  ScoreViewController.swift
//  TabooWordGame
//
//  Created by Batu on 15.05.2024.
//

import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func startAgainTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "backVC", sender: nil)
        
    }
    
    
}
