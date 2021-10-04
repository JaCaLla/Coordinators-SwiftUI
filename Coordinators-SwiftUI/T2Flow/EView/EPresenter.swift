//
//  EPresenter.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 4/10/21.
//

import Foundation
import Combine
import SwiftUI

protocol EPresenterProtocol: ObservableObject {
    var viewModel: EViewModel { get }
    func onPresentModal( onPresentingModal: () -> Void)
}

final class EPresenter: EPresenterProtocol {
    var view: EView<EPresenter, EViewModel>?
    @ObservedObject var viewModel: EViewModel
    var onSelected: () -> Void = { }
    
    init(viewModel: EViewModel,
         onSelected: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onSelected = onSelected
    }
    
    func onPresentModal( onPresentingModal: () -> Void) {
        // Do whatever costing calculations.
        
        onPresentingModal()
     //  showingDetail = true
      //  view?.presentModal()
    }
    
    static func tag() -> String {
       return String(describing: self)
    }
}
