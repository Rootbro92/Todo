//
//  MemoCell.swift
//  Todo
//
//  Created by 박근형 on 2020/02/13.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with content: String) {
        contentLabel.text = content
    }
}
