//
//  DateCell.swift
//  Todo
//
//  Created by 박근형 on 2020/02/14.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    
    //MARK:- UI Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK:- Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with date: Date?){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "Ko_kr")
        if let date = date {
            self.dateLabel.text = formatter.string(from: date)
        }
    }
}
