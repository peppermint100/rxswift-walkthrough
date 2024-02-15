//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
