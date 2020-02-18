//
//  MemoComposeViewController.swift
//  Todo
//
//  Created by 박근형 on 2020/02/13.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {
    
    //MARK:- UI Properties
    
    @IBOutlet weak var contentTextView: UITextView!
    
    //MARK:- Properties
    
    var memo: Memo?
    var addHandler: ((Memo) -> Void)?
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}

//MARK:- Actions
extension MemoComposeViewController {
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        guard let content = contentTextView.text,
            content.count > 0 else {
                let controller = UIAlertController(title: "알림", message: "메모를 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
                return
        }
        
        let memo = Memo(content: content, date: Date())
        addHandler?(memo)
        
        dismiss(animated: true, completion: nil)
    }
}

//MARK:- Methods
extension MemoComposeViewController {
    private func setupUI() {
        contentTextView.text = memo?.content
    }
}
