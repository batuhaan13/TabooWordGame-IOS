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
    var currentTour: Int = 1
    
    let tourValues = [5,10,15]
    let timeValues = [30,60,90]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tourSlider.minimumValue = 0
        tourSlider.maximumValue = 2
        tourSlider.value = 1
        
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = Float(timeValues.count - 1)
        timeSlider.value = 1
        
        timeSlider.addTarget(self, action: #selector(timeSlider(_:)), for: .valueChanged)
        tourSlider.addTarget(self, action: #selector(tourSliderChanged(_:)), for: .valueChanged)
        
        //updateTimeLabel()
        //updateTourLabel()
        updateLabels()
        
    }
    
    
    
    @IBAction func tourSliderChanged(_ sender: UISlider) {
        sender.value = round(sender.value)
        //let tourValues = [5,10,15]
        let index = Int(sender.value)
        selectedTour = tourValues[index]
        guard index >= 0 && index < tourValues.count else {
            return
        }
        
        selectedTour = tourValues[index]
        currentTour = 1
        updateLabels()
    }
    
    @IBAction func timeSlider(_ sender: UISlider) {
        sender.value = round(sender.value)
        //let timeSliderValue = [30,60,90]
        let index = Int(sender.value)
        guard index >= 0 && index < timeValues.count else {
            return
        }
        selectedTime = timeValues[index]
        updateLabels()
        
    }
    func updateLabels() {
        timeLabel.text = "\(selectedTime) Saniye"
        tourLabel.text = "\(selectedTour) Tur"
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTaboo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaboo" {
            if let tabooVC = segue.destination as? ViewController {
                tabooVC.selectedTour = selectedTour
                tabooVC.selectedTime = selectedTime
                tabooVC.currentTour = currentTour
            }
        }
    }
    
    
}
