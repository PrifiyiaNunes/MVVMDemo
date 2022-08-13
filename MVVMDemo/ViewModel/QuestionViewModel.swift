//
//  QuestionViewModel.swift
//  MVVMDemo
//
//  Created by Prifiyia on 12/08/22.
//

import Foundation

class QuestionViewModel {
    private var url = "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json"
    var quesionModel : QuestionModel?
    
    private func callApi() {
        APIService.shared().callApi(url: url, completion: { [weak self] (data, status) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalModel = try! jsonDecoder.decode(QuestionModel.self, from: data)
                self.quesionModel = finalModel
            }
        })
    }
}
