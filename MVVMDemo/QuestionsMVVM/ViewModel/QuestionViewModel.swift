//
//  QuestionViewModel.swift
//  MVVMDemo
//
//  Created by Prifiyia on 12/08/22.
//

import Foundation

protocol ApiFetchResponseDelegate {
    func returnAPICall(_ status: Bool)
}
class QuestionViewModel: NSObject {
    
    private var url = "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json"
    var quesionModel : QuestionModel?
    private var apiService : APIService?
    var delegate : ApiFetchResponseDelegate?
    
    override init() {
        super.init()
        self.apiService = APIService.shared()
        callApi(completion: { (questionData) in
            self.quesionModel = questionData
            self.delegate?.returnAPICall(true)
        })
    }
    
    func callApi(completion: @escaping (QuestionModel) -> ()) {
        self.apiService?.callAPI(url: url, completion: { [weak self] (data, status) in
            if status {
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let finalModel = try! jsonDecoder.decode(QuestionModel.self, from: data)
                    completion(finalModel)
                }
            }
        })
    }
}
