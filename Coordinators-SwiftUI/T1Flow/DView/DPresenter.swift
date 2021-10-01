//
//  CPresenter.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation
import SwiftUI

protocol DPresenterProtocol: ObservableObject {
    var viewModel: DViewModel { get }
    func onNextView()
}

final class DPresenter: DPresenterProtocol {
    @ObservedObject var viewModel: DViewModel
    var onPopToRoot: () -> Void = { }
    
    init(viewModel: DViewModel,
         onPopToRoot: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onPopToRoot = onPopToRoot
    }
    
    func onNextView() {
        self.onPopToRoot()
    }
}
