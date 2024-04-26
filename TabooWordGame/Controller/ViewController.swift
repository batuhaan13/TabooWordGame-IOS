//
//  ViewController.swift
//  TabooWordGame
//
//  Created by Batu on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
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
        //resetProgressView()
        updateTimer()
        
    }
    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        guard let startTime = startTime else { return }
        
        let currentTime = Date()
        let elapsedTime = currentTime.timeIntervalSince(startTime)
        let remainingTime = max(0, 30 - Int(elapsedTime))
        timerLabel.text = "\(remainingTime)"
        
        progressView.progress = Float(remainingTime) / 30
        
        if remainingTime == 0 {
            timer?.invalidate()
            showEndGameAlert()
        }
    }
    func resetProgressView() {
        progressView.setProgress(1.0, animated: false)
    }
    func showEndGameAlert() {
        let alert = UIAlertController(title: "Zaman doldu!", message: "Oyuna devam etmek istiyor musun?", preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            self?.resetTimer()
            self?.resetProgressView()
        }
        let cancelAction = UIAlertAction(title: "Hayır", style: .default)
        
        alert.addAction(continueAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func resetTimer() {
        remainingTime = 30
        timerLabel.text = "\(remainingTime)"
        startTime = Date()
    }
    func resetGame() {
        resetTimer()
        score = 0
        updateScoreLabel()
        showRandomTabooWord()
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
        showRandomTabooWord()
        
    }
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(score)"
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
            
            if viewModel.passAttempts == 0 {
                disablePassButton()
            }
        }
    }
    func updatePassButton() {
        pasButton.setTitle("PAS 3/\(viewModel.passAttempts)", for: .normal)
    }
    
    func disablePassButton() {
        pasButton.isEnabled = false
        pasButton.setTitleColor(.lightGray, for: .normal)
    }
    
    
    @IBAction func pauseResumeButtonTapped(_ sender: Any) {
        if isTimerRunning {
            timer?.invalidate()
            isTimerRunning = false
            elapsedTime += Date().timeIntervalSince(startTime!)
            startTime = nil // Süreyi durdurduğumuzda başlangıç zamanını nil olarak ayarlayalım.
            pauseResumeButton.setBackgroundImage(UIImage(named: "play"), for: .normal)
        } else {
            startTimer()
            startTime = Date(timeIntervalSinceNow: -elapsedTime)
            isTimerRunning = true
            pauseResumeButton.setBackgroundImage(UIImage(named: "pause"), for: .normal)
            
        }
    }
}

