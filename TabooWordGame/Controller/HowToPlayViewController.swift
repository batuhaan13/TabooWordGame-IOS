//
//  HowToPlayViewController.swift
//  TabooWordGame
//
//  Created by Batu on 8.05.2024.
//

import UIKit

class HowToPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func howToPlayButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toHowToPlay", sender: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "backVC", sender: nil)
    }
    
}
