//
//  MemoListViewController.swift
//  Todo
//
//  Created by 박근형 on 2020/02/12.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {
    
    //MARK:- UI Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    
    var memos: [Memo] = []
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadAll()
    }
}

//MARK:- Methods

extension MemoListViewController {
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func saveAll() {
        let data = memos.map { memo in
            [
                "content" : memo.content, "insertDate" : memo.date
            ]
        }
        AppUserDefaults.save(value: data, forKey:AppUserDefaults.Key.memoList)
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(data, forKey: UserDefaultsKeys.memoList)
//        userDefaults.synchronize()
    }
    
    func loadAll() {
        guard let data = AppUserDefaults.load(forKey: AppUserDefaults.Key.memoList) as? [[String: Any]] else { return }
        
        self.memos = data.map { memo in
            let content = memo["content"] as? String ?? ""
            let insertDate = memo["insertDate"] as? Date ?? Date()
            return Memo(content: content, date: insertDate)
        }
    }
}

//MARK:- Actions

extension MemoListViewController {
    @IBAction func addMemo(_ sender: Any) {
        if let naviVC = storyboard?.instantiateViewController(withIdentifier: String(describing: "MemoComposeViewController")) as? UINavigationController,
            let composeVC = naviVC.viewControllers.first as? MemoComposeViewController {
            
            composeVC.addHandler = { memo in
                self.memos.insert(memo, at: 0)
                self.saveAll()
                self.tableView.reloadData()
            }
            
            present(naviVC, animated: true, completion: nil)
        }
    }
}

//MARK:- TableView DataSource

extension MemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MemoCell.self), for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        cell.contentLabel.text = memos[indexPath.row].content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(
            withIdentifier: String(describing: MemoDetailViewController.self)
            ) as? MemoDetailViewController else { return }
        
        detailVC.configure(with: memos[indexPath.row], at: indexPath)
        detailVC.deleteHandler = { indexPath in
            self.memos.remove(at: indexPath.row)
            self.saveAll()
            self.tableView.reloadData()
        }
        detailVC.editHandler = { (memo, indexPath) in
            self.memos[indexPath.row] = memo
            self.saveAll()
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK:- TableView Delegate

extension MemoListViewController: UITableViewDelegate {
    
}
