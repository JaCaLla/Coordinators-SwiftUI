//
//  ViewA.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 26/9/21.
//

import SwiftUI
import Combine

struct AView<T: APresenterProtocol, VM: AViewModelProtocol>: View {
    
    @ObservedObject var presenter: T
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            Text(viewModel.runCountStr).font(.system(size: 200))
            Button {
                self.presenter.onButtonPressed()
            } label: {
                Text("Go to B")
            }.padding()
        }.navigationTitle("A Navigation bar")
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = ACoordinator()
        return AFactory.make(with: coordinator, onSelected: {})
    }
}

enum AFactory {
    static func make(with coordinator: ACoordinator, onSelected: @escaping () -> Void) -> some View {
        let viewModel = AViewModel()
        let presenter = APresenter(viewModel: viewModel,
                                   onSelected: onSelected)
        let view = AView(presenter: presenter, viewModel: viewModel)
        return view
    }
}
