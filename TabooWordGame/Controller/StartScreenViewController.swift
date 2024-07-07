//
//  StartScreenViewController.swift
//  TabooWordGame
//
//  Created by Batu on 7.05.2024.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var howToPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //startButton.backgroundColor = UIColor.systemPink
        //howToPlay.backgroundColor = UIColor.systemPink
        
        //startButton.layer.cornerRadius = 10
        //startButton.layer.masksToBounds = true
        
        //howToPlay.layer.cornerRadius = 10
       //howToPlay.layer.masksToBounds = true
        
        //startButton.layer.shadowColor = UIColor.black.cgColor
        //startButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        //startButton.layer.opacity = 0.5
        //startButton.layer.shadowRadius = 5
    }
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toStartSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStartSegue" {
            if let tabooGameVC = segue.destination as? ViewController {
                
            }
        }
    }
}
