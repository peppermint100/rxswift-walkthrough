//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
        
    var viewModel: MemoDetailViewModel!
    
    @IBOutlet var listTableView: UITableView!
    
    @IBOutlet var shareButton: UIBarButtonItem!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var deleteButton: UIBarButtonItem!
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.contents
            .bind(to: listTableView.rx.items) { tableView, row, value in
                switch row{
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: rx.disposeBag)
        
        editButton.rx.action = viewModel.makeEditAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
