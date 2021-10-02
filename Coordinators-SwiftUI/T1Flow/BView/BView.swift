//
//  BView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 27/9/21.
//

import SwiftUI

//struct BView: View {
//    static let tag = String(describing: BView.self)
//    var body: some View {
//        Text("B").font(.system(size: 200))
//    }
//}

struct BView<T: BPresenterProtocol, VM: BViewModelProtocol>: View {

    @ObservedObject var presenter: T
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            Text(viewModel.runCountStr).font(.system(size: 200))
            Button {
                self.presenter.onButtonPressed()
            } label: {
                Text("Go to C")
            }.padding()
        }.navigationTitle("B Navigation bar")
    }
}

struct BView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = BCoordinator()
        return BFactory.make(with: coordinator, onSelected: {})
    }
}

enum BFactory {
    static func make(with coordinator: BCoordinator, onSelected: @escaping () -> Void) -> some View {
        let viewModel = BViewModel()
        let presenter = BPresenter(viewModel: viewModel,
                                   onSelected: onSelected)
        let view = BView(presenter: presenter, viewModel: viewModel)
        return view
    }
    
    static func tag() -> String {
        String(describing: self)
    }
}
