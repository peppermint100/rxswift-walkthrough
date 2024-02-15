//
//  TransitionModel.swift
//  RxMemo
//
//  Created by peppermint100 on 2/15/24.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
