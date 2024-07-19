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
    @IBOutlet weak var tabooWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.tabooWordLabel.frame.origin.y += 50
        }, completion: nil)
        
        
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
