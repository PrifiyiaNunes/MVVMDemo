//
//  QuestionModel.swift
//  MVVMDemo
//
//  Created by Prifiyia on 12/08/22.
//

import Foundation

struct QuestionModel: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let correctAnswer, option1, option2, option3: String
    let option4, question: String

    enum CodingKeys: String, CodingKey {
        case correctAnswer = "correct_answer"
        case option1 = "option_1"
        case option2 = "option_2"
        case option3 = "option_3"
        case option4 = "option_4"
        case question = "question"
    }
}
