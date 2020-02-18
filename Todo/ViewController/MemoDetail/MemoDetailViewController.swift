//
//  MemoDetailViewController.swift
//  Todo
//
//  Created by 박근형 on 2020/02/14.
//  Copyright © 2020 pgh. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {
    
    enum CellType: Int {
        case content,
        date
    }
    
    //MARK:- UI Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    
    private var memo: Memo?
    private var indexPath: IndexPath?
    var deleteHandler: ((IndexPath) -> Void)?
    var editHandler: ((Memo, IndexPath) -> Void)?
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
    }
}

//MARK:- Methods

extension MemoDetailViewController {
    private func SetupUI(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure(with memo: Memo, at indexPath: IndexPath) {
        self.memo = memo
        self.indexPath = indexPath
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK:- Actions

extension MemoDetailViewController {
    @IBAction func pop(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteMemo(_ sender: UIBarButtonItem) {
        guard let indexPath = indexPath else { return }
        deleteHandler?(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editMemo(_ sender: UIBarButtonItem) {
        guard let naviVC = storyboard?.instantiateViewController(withIdentifier: "MemoComposeViewController") as? UINavigationController,
            let composeVC = naviVC.viewControllers.first as? MemoComposeViewController else { return }
        composeVC.memo = memo
        composeVC.addHandler = { [weak self] memo in
            self?.memo = memo
            self?.reload()
        }
        present(naviVC, animated: true, completion: nil)
    }
}

//MARK:- TableView DataSource

extension MemoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch CellType(rawValue: indexPath.row) {
        case .content:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ContentCell", for: indexPath
                ) as? ContentCell else {
                    return UITableViewCell()
            }
            cell.configure(with: memo?.content)
            return cell
            
        case .date:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "DateCell", for: indexPath
                ) as? DateCell else {
                    return UITableViewCell()
            }
            cell.configure(with: memo?.date)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

//MARK:- TableView Delegate

extension MemoDetailViewController: UITableViewDelegate {
    
}
