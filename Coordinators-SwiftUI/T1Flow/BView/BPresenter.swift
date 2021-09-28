//
//  BPresenter.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 28/9/21.
//

import Foundation
import SwiftUI

protocol BPresenterProtocol: ObservableObject {
    var viewModel: BViewModel { get }
    func onButtonPressed()
}

final class BPresenter: BPresenterProtocol {
    @ObservedObject var viewModel: BViewModel
    var onSelected: () -> Void = { }
    
    init(viewModel: BViewModel,
         onSelected: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onSelected = onSelected
    }
    
    func onButtonPressed() {
        self.onSelected()
    }
}
