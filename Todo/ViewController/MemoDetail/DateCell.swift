//
//  DateCell.swift
//  Todo
//
//  Created by 박근형 on 2020/02/14.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
