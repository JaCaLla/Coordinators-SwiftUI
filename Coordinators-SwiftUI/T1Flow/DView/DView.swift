//
//  DView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import SwiftUI

struct DView<T: DPresenterProtocol, VM: DViewModelProtocol>: View {
    func tag() -> String {
        String(describing: DView.self)
    }
    @ObservedObject var presenter: T
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            Text(viewModel.runCountStr).font(.system(size: 200))
        }
        .navigationTitle("D Navigation bar")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("End") {
                    presenter.onNextView()
                }
            }
        }
        }
    }


struct DView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = DCoordinator()
        return DFactory.make(with: coordinator,
                             onPopToRoot: {})
    }
}

enum DFactory {
    
    static func tag() -> String {
        String(describing: self)
    }
    
    static func make(with coordinator: DCoordinator,
                     onPopToRoot: @escaping () -> Void) -> some View {
        let viewModel = DViewModel()
        let presenter = DPresenter(viewModel: viewModel,
                                   onPopToRoot: onPopToRoot)
        let view = DView(presenter: presenter, viewModel: viewModel)
        return view
    }
}
