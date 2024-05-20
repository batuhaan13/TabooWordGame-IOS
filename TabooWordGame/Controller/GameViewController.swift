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
            pauseResumeButton.setImage(UIImage(named: "play-button"), for: .normal)
            isTimerRunning = false
        } else {
            startTime = Date() - elapsedTime
            pauseResumeButton.setImage(UIImage(named: "pause"), for: .normal)
            
            
            startTimer()
        }
    }
    
    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var goalWordLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var passButtonLabel: UIButton!
    
    
    
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
    
    var selectedTour: Int = 0
    var selectedTime: Int = 0
    
    var currentTour: Int = 1
    var totalTours: Int = 5
    
    private var viewModel = TabooWordsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view.
        showRandomTabooWord()
        roundButtons()
        startTimer()
        updateTimer()
    }
    func startNewTour() {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
        
        let remainingTime = max(0, selectedTime - Int(totalElapsedTime))
        
        print("Remaining Time: ", remainingTime)
        
        if remainingTime <= 0 {
            timer?.invalidate()
            timer = nil
            performSegue(withIdentifier: "NextVC", sender: nil)
            
            return
        }
        
        progressView.progress = Float(remainingTime) / Float(selectedTime)
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextVC" {
            if let nextVC = segue.destination as? ScoreViewController {
                nextVC.score = Int(scoreLabel.text ?? "0")
            }
        }
    }
    func resetProgressView() {
        progressView.setProgress(1.0, animated: false)
    }
    
    func showEndGameAlert() {
        
        timer?.invalidate()
        isTimerRunning = false
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            
            
            self?.continueGame()
            self?.resetGame()
            self?.resetProgressView()
            self?.resetTimer()
            self?.updatePassButton()
            self?.resetScore()
            self?.resetPass()
            
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
    func resetScore() {
        scoreLabel.text = "0"
    }
    
    func resetGame() {
        startTime = Date()
        
        startTimer()
        resetTimer()
        showRandomTabooWord()
    }
    func resetPass() {
        viewModel.passAttempts = 3
        pasButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        updatePassButton()
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
        if let randomTabooWord = viewModel.getRandomTabooWord() {
            goalWordLabel.text = randomTabooWord.goalWord
            
            for (index, tabooWord) in randomTabooWord.tabooWords.enumerated() {
                tabooWordLabels[index].text = tabooWord
            }
        } else {
            print("Tüm kelimeler kullanıldı. Oyunu bitir veya yeniden başlat.")
        }
    }
    
    
    @IBAction func correctButtonTapped(_ sender: UIButton) {
        score = max(0, score + 1)
        viewModel.increaseScore()
        updateScoreLabel()
        showRandomTabooWord()
        
        
    }
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    @IBAction func boomButtonTapped(_ sender: UIButton) {
        score = max(0, score - 1)
        updateScoreLabel()
        showRandomTabooWord()
        
    }
    
    
    @IBAction func pasButtonTapped(_ sender: UIButton) {
        if viewModel.passAttempts > 0 {
            viewModel.passAttempts -= 1
            
            updatePassButton()
            showRandomTabooWord()
            
            if viewModel.passAttempts == 0 {
                showAlert(title: "Pas Hakkı Kalmadı", message: "Pas hakkınız bitti.")
                pasButton.isHidden = true
            }
        }
    }
    func updatePassButton() {
        let remainingAttempts = viewModel.passAttempts
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let alertButton = UIAlertController(title: "Geri Dön", message: "Ana ekrana dönmek istiyor musun?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "toBackVC", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Hayır", style: .cancel)
        alertButton.addAction(alertAction)
        alertButton.addAction(cancelAction)
        present(alertButton, animated: true)
    }
    func updateTourLabel() {
        tourLabel.text = "\(currentTour)\(totalTours)"
    }
    @IBAction func unwindToGame(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? ScoreViewController {
            
            startTime = nil
            elapsedTime = 0
            score = 0
            remainingTime = selectedTime
            
            
            startTimer()
            
            
            showRandomTabooWord()
        }
    }
    
    
    
}







