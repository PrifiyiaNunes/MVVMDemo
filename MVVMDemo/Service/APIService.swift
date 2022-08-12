//
//  APIService.swift
//  MVVMDemo
//
//  Created by Prifiyia on 12/08/22.
//

import Foundation

class APIService {
    func callAPI(url: String, completion: @escaping (_ data: Data?, _ status: Bool) -> ()) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                if let data = data {
                    completion(data, true)
                }
            }else {
                completion(data, false)
            }
        }).resume()
    }
}
