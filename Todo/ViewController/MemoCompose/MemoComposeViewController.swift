//
//  MemoComposeViewController.swift
//  Todo
//
//  Created by 박근형 on 2020/02/13.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController {
    @IBOutlet weak var contentTextView: UITextView!
    
    var memo: Memo?
    var addHandler: ((Memo) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    private func setupUI() {
      contentTextView.text = memo?.content
    }
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
