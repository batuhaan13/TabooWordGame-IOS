//
//  ViewController.swift
//  TabooWordGame
//
//  Created by Batu on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func pauseResumeButtonTapped(_ sender: UIButton) {
        if isTimerRunning {
            timer?.invalidate()
            if let startTime = startTime {
                elapsedTime += Date().timeIntervalSince(startTime)
                
            }
            pauseResumeButton.setImage(UIImage(named: "play"), for: .normal)
            isTimerRunning = false
        } else {
            startTime = Date() - elapsedTime
            pauseResumeButton.setImage(UIImage(named: "pause"), for: .normal)
            
            
            startTimer()
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var goalWordLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBOutlet var tabooWordLabels: [UILabel]!
    
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var pasButton: UIButton!
    @IBOutlet weak var boomButton: UIButton!
    @IBOutlet weak var pauseResumeButton: UIButton!
    
    var timer: Timer?
    var startTime: Date?
    var isTimerRunning = false
    var remainingTime = 30
    var score = 0
    var elapsedTime: TimeInterval = 0
    private var viewModel = TabooWordsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showRandomTabooWord()
        roundButtons()
        startTimer()
        updateTimer()
        
    }
    
    func startTimer() {
        if !isTimerRunning {
            startTime = Date()
            isTimerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            updateTimer()
        }
    }
    @objc func updateTimer() {
        guard let startTime = startTime else { return }
        
        let currentTime = Date()
        let timePassedSinceStart = currentTime.timeIntervalSince(startTime)
        let totalElapsedTime = elapsedTime + timePassedSinceStart
        
        let remainingTime = max(0, 30 - Int(totalElapsedTime))
        
        timerLabel.text = "\(remainingTime)"
        progressView.progress = Float(remainingTime) / 30.0
        
        if remainingTime == 0 {
            timer?.invalidate()
            timer = nil
            showEndGameAlert()
            
            elapsedTime = 0
            
        }
        
    }
    func resetProgressView() {
        progressView.setProgress(1.0, animated: false)
    }
    
    func showEndGameAlert() {
        
        timer?.invalidate()
        isTimerRunning = false
        
        let alert = UIAlertController(title: "Zaman doldu!", message: "Oyuna devam etmek istiyor musun?", preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            
            self?.continueGame()
            self?.resetGame()
            self?.resetProgressView()
            self?.resetTimer()
            self?.updatePassButton()
        }
        let cancelAction = UIAlertAction(title: "Hayır", style: .cancel)
        
        alert.addAction(continueAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        
    }
    func continueGame() {
        resetGame()
        resetProgressView()
        resetTimer()
        updatePassButton()
    }

    func resetGame() {
        startTime = Date()
        startTimer()
        resetTimer()
        showRandomTabooWord()
    }
    func resetTimer() {
        startTime = Date()
        
    }
    
    func roundButtons() {
        let buttons : [UIButton] = [correctButton, pasButton, boomButton, pauseResumeButton]
        
        for button in buttons {
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
    }
    
    @IBAction func newWordButtonTapped(_ sender: UIButton) {
        showRandomTabooWord()
    }
    
    
    func showRandomTabooWord() {
        let randomTabooWord = viewModel.getRandomTabooWord()
        goalWordLabel.text = randomTabooWord.goalWord
        
        for (index, tabooWord) in randomTabooWord.tabooWords.enumerated() {
            tabooWordLabels[index].text = tabooWord
            
        }
    }
    @IBAction func correctButtonTapped(_ sender: UIButton) {
        score = max(0, score + 1)
        viewModel.increaseScore()
        updateScoreLabel()
        resetTimer()
        showRandomTabooWord()
        
        
    }
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(score)"
    }
    @IBAction func boomButtonTapped(_ sender: UIButton) {
        score = max(0, score - 1)
        updateScoreLabel()
        resetTimer()
        showRandomTabooWord()
        
    }
    
    
    @IBAction func pasButtonTapped(_ sender: UIButton) {
        if viewModel.passAttempts > 0 {
            viewModel.passAttempts -= 1
            updatePassButton()
            showRandomTabooWord()
            resetTimer()
            
            if viewModel.passAttempts == 0 {
                disablePassButton()
                showAlert(title: "Pas Hakkı Kalmadı", message: "Pas hakkınız bitti.")
                
            }
        }
    }
    func updatePassButton() {
        let remainingAttempts = viewModel.passAttempts
        let imageIndex = 2 - remainingAttempts
        let passImages = ["pass32","pass31"]
        
        if imageIndex >= 0 && imageIndex < passImages.count {
            let imageName = passImages[imageIndex]
            pasButton.setImage(UIImage(named: imageName), for: .normal)
            
        }
        
        
        
        
    }
    
    
    func disablePassButton() {
        pasButton.isEnabled = false
        pasButton.setTitleColor(.lightGray, for: .normal)
        pasButton.setImage(UIImage(named: "pass30"), for: .normal)
    }
    
    
    
}
