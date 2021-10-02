//
//  APresenter.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 26/9/21.
//

import Foundation
import Combine
import SwiftUI

protocol APresenterProtocol: ObservableObject {
    var viewModel: AViewModel { get }
    func onButtonPressed()
}

final class APresenter: APresenterProtocol {   
    @ObservedObject var viewModel: AViewModel
    var onSelected: () -> Void = { }
    
    init(viewModel: AViewModel,
         onSelected: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onSelected = onSelected
    }
    
    func onButtonPressed() {
        self.onSelected()
    }
}
