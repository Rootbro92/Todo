//
//  Memo.swift
//  Todo
//
//  Created by 박근형 on 2020/02/13.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation

struct Memo {
    var date: Date
    var content: String
    
    init(content: String, date: Date) {
        self.date = date
        self.content = content
    }
    
}
