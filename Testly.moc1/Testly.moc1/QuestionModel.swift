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
    
}

//Overriding the == operator at the global scope when it is used on two QuestionModel.
func == (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
    return lhs.question == rhs.question
}



