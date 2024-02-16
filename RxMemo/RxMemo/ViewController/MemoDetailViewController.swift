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
    @IBOutlet var deleteButton: UIToolbar!
    @IBOutlet var editButton: UIToolbar!
    @IBOutlet var shareButton: UIToolbar!
    
    func bindViewModel() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
