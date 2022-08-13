//
//  QuestionTableViewDataSource.swift
//  MVVMDemo
//
//  Created by Prifiyia on 13/08/22.
//

import UIKit

class QuestionTableViewDataSource<CELL: UITableViewCell, T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier: String?
    private var items: [T]?
    var configureCell: (CELL, T) -> () = {_,_ in}
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> () ) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ?? "", for: indexPath) as! CELL
        if let item = self.items?[indexPath.row] {
            self.configureCell(cell, item)
        }
        return cell
    }
}
