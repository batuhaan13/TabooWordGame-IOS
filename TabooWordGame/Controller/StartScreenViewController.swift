//
//  StartScreenViewController.swift
//  TabooWordGame
//
//  Created by Batu on 7.05.2024.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
