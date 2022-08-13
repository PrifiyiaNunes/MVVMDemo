//
//  QuestionTableViewCell.swift
//  MVVMDemo
//
//  Created by Prifiyia on 13/08/22.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var lblQuestions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
