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
    
    let tourValues : [Float] = [5,10,15]
    let timeValues : [Float] = [30,60,90]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
        
    }
    func setupSliders() {
        tourSlider.minimumValue = 0
        tourSlider.maximumValue = Float(tourValues.count - 1)
        tourSlider.value = 1 // Default to middle value
        tourSlider.isContinuous = true
        tourSlider.addTarget(self, action: #selector(tourSliderChanged(_:)), for: .valueChanged)
        
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = Float(timeValues.count - 1)
        timeSlider.value = 1 // Default to middle value
        timeSlider.isContinuous = true
        timeSlider.addTarget(self, action: #selector(timeSlider(_:)), for: .valueChanged)
        
        updateLabels()
    }
    
    @IBAction func tourSliderChanged(_ sender: UISlider) {
        let step: Float = 1
        let newValue = round(sender.value / step) * step
        sender.value = newValue
        
        let index = Int(round(sender.value))
        guard index >= 0 && index < tourValues.count else { return }
        selectedTour = Int(tourValues[index])
        updateLabels()
    }
    
    @IBAction func timeSlider(_ sender: UISlider) {
        let step: Float = 1
        let newValue = round(sender.value / step) * step
        sender.value = newValue
        
        let index = Int(round(sender.value))
        guard index >= 0 && index < timeValues.count else { return }
        selectedTime = Int(timeValues[index])
        updateLabels()
    }
    
    func updateLabels() {
        timeLabel.text = "\(selectedTime) Saniye"
        tourLabel.text = "\(selectedTour) Tur"
        print("Updated Labels: \(timeLabel.text),\(tourLabel.text)") // Debugging
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toTaboo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaboo" {
            if let tabooVC = segue.destination as? ViewController {
                tabooVC.selectedTour = selectedTour
                tabooVC.selectedTime = selectedTime
                //tabooVC.currentTour = currentTour
            }
        }
    }
    
    
}
