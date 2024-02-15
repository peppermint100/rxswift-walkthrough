//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
