//
//  QuestionViewController.swift
//  CW4 - Personal Quiz
//
//  Created by Сергей Ткаченко on 05.10.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IB Outlets

    @IBOutlet var quesyionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    // MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - IB Actions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
    }
    
    // MARK: - Private Methods
    
    //Update user interface
    private func updateUI() {
        // Hide everything
        for stackview in [singleStackView, multipleStackView, rangedStackView] {
            stackview?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question label
        quesyionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgres = Float(questionIndex / questions.count)
        
        // Set progress for question progress view
        questionProgressView.setProgress(totalProgres, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        
        let currentAnswers = currentQuestion.answers
        
        // Show stack view corresponding to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    /// Setup single stack view
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    private func updateSingleStackView(using answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers)  {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    /// Setup multiple stack view
    /// - Parameter answers: - array with answers
    private func updateMultipleStackView(using answers: [Answer]) {
        // Show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers)  {
            label.text = answer.text
        }
    }
    
    /// Setup ranged stack view
    /// - Parameter answers: - array with answers
    private func updateRangedStackView(using answers: [Answer]) {
        // Show ranged stack view
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
}
