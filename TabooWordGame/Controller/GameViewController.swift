//
//  ViewController.swift
//  TabooWordGame
//
//  Created by Batu on 23.04.2024.
//

import UIKit

class ViewController: UIViewController, ScoreViewControllerDelegate {
    
    
    
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
    
    @IBOutlet weak var redScoreLabel: UILabel!
    
    
    @IBOutlet var tabooWordLabels: [UILabel]!
    
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var pasButton: UIButton!
    @IBOutlet weak var boomButton: UIButton!
    @IBOutlet weak var pauseResumeButton: UIButton!
    
    var timer: Timer?
    var startTime: Date?
    var isTimerRunning = false
    var score = 0
    var redScore = 0
    var elapsedTime: TimeInterval = 0
    var selectedTour: Int = 0
    var selectedTime: Int = 0
    var currentTour: Int = 1
    var remainingTime = 30
    var totalBlueScore = 0
    var totalRedScore = 0
    
    
    
    private var viewModel = TabooWordsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        showRandomTabooWord()
        roundButtons()
        startTimer()
        updateTimer()
        updateTourLabel()
    }
    func startNewTour() {
        elapsedTime = 0
        startTime = Date()
        
        updateScoreLabel()
        updateTourLabel()
        startTimer()
        
    }
    
    
    
    func startTimer() {
        if !isTimerRunning {
            startTime = Date()
            isTimerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            
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
        
        if remainingTime <= 5 {
            progressView.progressTintColor = .red
            shakeProgressView()
        } else if remainingTime <= 10 {
            progressView.progressTintColor = .orange
            shakeProgressView()
        } else {
            progressView.progressTintColor = .green
        }
        
        
        
    }
    
    func updateTourLabel() {
        
        tourLabel.text = "\(currentTour)/\(selectedTour)"
        print("Updated Labels: \(tourLabel.text)")
    }
    func nextTour() {
        if currentTour < selectedTour {
            currentTour += 1
            updateTourLabel()
        } else {
            showTotalScore()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NextVC" {
            if let nextVC = segue.destination as? ScoreViewController {
                nextVC.score = score
                nextVC.currentTour = currentTour
                nextVC.totalTours = selectedTour
                nextVC.redScore = redScore
                
                nextVC.delegate = self
            }
        } else if segue.identifier == "toTotalScoreVC" {
            if let totalScoreVC = segue.destination as? TotalScoreViewController {
                totalScoreVC.totalBlueScore = totalBlueScore
                totalScoreVC.totalRedScore = totalRedScore
            }
        }
    }
    func showTotalScore() {
        performSegue(withIdentifier: "toTotalScoreVC", sender: nil)
    }
    func resetProgressView() {
        progressView.setProgress(1.0, animated: false)
    }
    
    func showEndGameAlert() {
        let alert = UIAlertController(title: "Oyun Bitti", message: "Toplam Skor: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "toMainMenu", sender: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        
    }
    
    func restartTimer() {
        elapsedTime = 0
        startTime = Date()
        startTimer()
    }
    func restartProgress() {
        progressView.progress = 1.0
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
        score += 1
        totalBlueScore += 1
        viewModel.increaseScore()
        updateScoreLabel()
        showRandomTabooWord()
        
        
    }
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
        redScoreLabel.text = "\(redScore)"
    }
    @IBAction func boomButtonTapped(_ sender: UIButton) {
        redScore += 1
        totalRedScore += 1
        updateScoreLabel()
        showRandomTabooWord()
        
    }
    
    
    @IBAction func pasButtonTapped(_ sender: UIButton) {
        if viewModel.passAttempts > 0 {
            viewModel.passAttempts -= 1
            
            
            showRandomTabooWord()
            
            if viewModel.passAttempts == 0 {
                showAlert(title: "Pas Hakkı Kalmadı", message: "Pas hakkınız bitti.")
                pasButton.isHidden = true
            }
        }
    }
    func updatePassButton() {
        let remainingAttempts = viewModel.passAttempts
        pasButton.setTitle("\(remainingAttempts)", for: .normal)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let alertButton = UIAlertController(title: "Geri Dön", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "toBackVC", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Hayır", style: .cancel)
        alertButton.addAction(alertAction)
        alertButton.addAction(cancelAction)
        present(alertButton, animated: true)
    }
    
    @IBAction func unwindToGame(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? ScoreViewController {
            if currentTour < selectedTour {
                currentTour += 1
                startNewTour()
            } else {
                showEndGameAlert()
            }
            
        }
        
    }
    func shakeProgressView() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: progressView.center.x - 5, y: progressView.center.y)
        let toPoint = CGPoint(x: progressView.center.x + 5, y: progressView.center.y)
        
        shake.fromValue = NSValue(cgPoint: fromPoint)
        shake.toValue = NSValue(cgPoint: toPoint)
        
        progressView.layer.add(shake, forKey: "position")
    }
    func didContinueToNextRound() {
        nextTour()
        startNewTour()
        restartProgress()
        
    }
    
}







