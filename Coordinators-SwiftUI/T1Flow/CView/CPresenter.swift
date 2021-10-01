//
//  CPresenter.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation
import SwiftUI

protocol CPresenterProtocol: ObservableObject {
    var viewModel: CViewModel { get }
    func onButtonPressed()
    func onNextView()
}

final class CPresenter: CPresenterProtocol {
    @ObservedObject var viewModel: CViewModel
    var onPopToRoot: () -> Void = { }
    var onPresentD: () -> Void = { }
    
    init(viewModel: CViewModel,
         onPopToRoot: @escaping () -> Void,
         onPresentD: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onPopToRoot = onPopToRoot
        self.onPresentD = onPresentD
    }
    
    func onButtonPressed() {
        self.onPopToRoot()
    }
    
    func onNextView() {
        self.onPresentD()
    }
}
