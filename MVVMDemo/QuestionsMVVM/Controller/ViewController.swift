//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Prifiyia on 13/08/22.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questionModel : QuestionModel?
    var viewmodel = QuestionViewModel()
    
    private var dataSource: QuestionTableViewDataSource<QuestionTableViewCell, Question?>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.delegate = self
    }
    
    func callToViewModelForUIUpdate() {
        self.questionModel = self.viewmodel.quesionModel
        self.updateDataSource()
    }
    
    func updateDataSource() {
        if let questionData = questionModel?.data.questions {
            self.dataSource = QuestionTableViewDataSource(cellIdentifier: "QuestionTableViewCell", items: questionData, configureCell: { (cell, questions) in
                cell.lblQuestions.text = questions?.question ?? ""
            })
            DispatchQueue.main.async {
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController : ApiFetchResponseDelegate {
    func returnAPICall(_ status: Bool) {
        if status {
            callToViewModelForUIUpdate()
        }
    }
}
