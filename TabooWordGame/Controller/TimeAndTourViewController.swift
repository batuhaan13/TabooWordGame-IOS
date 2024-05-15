//
//  TimeAndTourViewController.swift
//  TabooWordGame
//
//  Created by Batu on 14.05.2024.
//

import UIKit

class TimeAndTourViewController: UIViewController {
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tourSlider: UISlider!
    @IBOutlet weak var tourLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tourSliderChanged(_ sender: UISlider) {
        sender.value = round(sender.value)
        let tourValue = [5,10,15]
        let index = Int(sender.value)
        tourLabel.text = "\(tourValue[index]) Tur"
    }
    
    @IBAction func timeSlider(_ sender: UISlider) {
        sender.value = round(sender.value)
        let timeSliderValue = [30,60,90]
        let index = Int(sender.value)
        timeLabel.text = "\(timeSliderValue[index]) Saniye"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTaboo", sender: nil)
    }
    
}
