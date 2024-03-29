//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
