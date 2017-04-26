//
//  QuestionModel.swift
//  QuizzGame
//
//  Created by Andrea Miotto on 26/06/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

struct QuestionModel: Equatable {
    
    var question: String
    var answers: [String]
    var correctAnswer: Int
    
    //method to get the correct answer
    func getCorrectAnswer() -> String {
        return answers[correctAnswer]
    }
    
    init(dictionary: [String:Any], question: String, correctAnswer: String)
    {
        self.question = dictionary[question] as? String ?? ""
        self.answers = []
        for i in 1...4 {
            var answer = "A" + String(i)
            var tempString = dictionary[answer + question] as? String
            if (tempString?.characters.count)! > 0{
                answers.append(tempString!)
            }
        }
        self.correctAnswer = Int(correctAnswer)!
    }
    init(question: String, answers: [String], correctAnswer: Int){
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}

//Overriding the == operator at the global scope when it is used on two QuestionModel.
func == (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
    return lhs.question == rhs.question
}



