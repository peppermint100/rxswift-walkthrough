//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import UIKit
import RxSwift
import RxCocoa

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
        
        /*
         action 방식과 tap 방식의 차이점
         action 방식
         - viewModel에서 만드므로 Scene과 연결해줄 필요가 있었음
         - ActivityController의 close 버튼과 SceneCoordinator의 close도 연결해주어야 함
         - 로직이 viewModel에 집중되어 구조적으로 좋음
         tap 방식
         - 간단함
         - SceneCoordinator를 거치지 않음
         */
        shareButton.rx.action = viewModel.makeShareAction()
//        shareButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [weak self] _ in
//                guard let memo = self?.viewModel.memo.content else { return }
//                let vc = UIActivityViewController(activityItems: [memo], applicationActivities: nil)
//                self?.present(vc, animated: true, completion: nil)
//            })
//            .disposed(by: rx.disposeBag)
        deleteButton.rx.action = viewModel.makeDeleteAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
