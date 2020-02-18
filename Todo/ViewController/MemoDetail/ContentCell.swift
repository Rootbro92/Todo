//
//  ContentCell.swift
//  Todo
//
//  Created by 박근형 on 2020/02/14.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

    //MARK:- UI Properties
    
    @IBOutlet weak var contentLabel: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with content: String?){
        self.contentLabel.text = content
    }
}
