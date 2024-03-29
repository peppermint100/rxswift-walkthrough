//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!
    
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
//            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) { row, memo, cell in
//                cell.textLabel?.text = memo.content
//            }
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
        
        Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
            .do(onNext: { [unowned self] (_, indexPath) in
                self.listTableView.deselectRow(at: indexPath, animated: true)
            })
            .map { $0.0 }
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        // control 액션만 만들어도 자동으로 swipe to delete가 tableview에 추가된다.
        listTableView.rx.modelDeleted(Memo.self)
            .bind(to: viewModel.deleteAction.inputs)
            .disposed(by: rx.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
