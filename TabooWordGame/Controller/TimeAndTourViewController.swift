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
    
    var selectedTour: Int = 10
    var selectedTime: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tourSlider.minimumValue = 0
        tourSlider.maximumValue = 2
        tourSlider.value = 1
        
        
        
        tourSlider.addTarget(self, action: #selector(tourSliderChanged), for: .valueChanged)
        
        //updateTimeLabel()
        //updateTourLabel()
        
    }
    
    
    
    @IBAction func tourSliderChanged(_ sender: UISlider) {
        sender.value = round(sender.value)
        let tourValues = [5,10,15]
        let index = Int(sender.value)
        //selectedTour = tourValues[index]
        guard index >= 0 && index < tourValues.count else {
            return
        }
        
        selectedTour = tourValues[index]
        tourLabel.text = "\(selectedTour) Tur"
    }
    
    @IBAction func timeSlider(_ sender: UISlider) {
        sender.value = round(sender.value)
        let timeSliderValue = [30,60,90]
        let index = Int(sender.value)
        selectedTime = timeSliderValue[index]
        timeLabel.text = "\(selectedTime) Saniye"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTaboo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaboo" {
            if let tabooVC = segue.destination as? ViewController {
                tabooVC.selectedTour = selectedTour
                tabooVC.selectedTime = selectedTime
            }
        }
    }
    //func updateTimeLabel() {
     //   timeLabel.text = "\(selectedTime) Saniye"
   // }
    //func updateTourLabel() {
    //    tourLabel.text = "\(selectedTour) Tur"
    //}
 
}
