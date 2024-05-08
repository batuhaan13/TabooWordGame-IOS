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
        
        performSegue(withIdentifier: "toTaboo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaboo" {
            if let tabooGameVC = segue.destination as? ViewController {
                
            }
        }
    }
}
