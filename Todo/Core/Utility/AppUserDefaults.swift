//
//  AppUserDefaults.swift
//  Todo
//
//  Created by 박근형 on 2020/02/17.
//  Copyright © 2020 pgh. All rights reserved.
//

import Foundation

struct AppUserDefaults {
    
    static func save(value: Any?, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func load(forKey: String) -> Any? {
        UserDefaults.standard.object(forKey: forKey)
    }
}
