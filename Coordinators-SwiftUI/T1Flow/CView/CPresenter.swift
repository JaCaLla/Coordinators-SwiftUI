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
}

final class CPresenter: CPresenterProtocol {
    @ObservedObject var viewModel: CViewModel
    var onSelected: () -> Void = { }
    
    init(viewModel: CViewModel,
         onSelected: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onSelected = onSelected
    }
    
    func onButtonPressed() {
        self.onSelected()
    }
}
