//
//  CView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import SwiftUI

struct CView<T: CPresenterProtocol, VM: CViewModelProtocol>: View {
    func tag() -> String {
        String(describing: CView.self)
    }
    @ObservedObject var presenter: T
    @ObservedObject var viewModel: VM
    @Environment(\.currentTab) var tab
    var body: some View {
        VStack {
            Text(viewModel.runCountStr).font(.system(size: 200))
            Button {
                self.presenter.onNextView()
            } label: {
                Text("Go to D")
            }
            Button {
                self.presenter.onButtonPressed()
            } label: {
                Text("Pop to root")
            }.padding()
            Button {
                tab.wrappedValue = .branch
            } label: {
                Text("Switch to Branch tab")
            }.padding()
        }.navigationTitle("C Navigation bar")
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = CCoordinator()
        return CFactory.make(with: coordinator,
                             onPopToRoot: {},
                             onPresentD: {})
    }
}

enum CFactory {
    
    static func tag() -> String {
        String(describing: self)
    }
    
    static func make(with coordinator: CCoordinator,
                     onPopToRoot: @escaping () -> Void,
                     onPresentD: @escaping () -> Void) -> some View {
        let viewModel = CViewModel()
        let presenter = CPresenter(viewModel: viewModel,
                                   onPopToRoot: onPopToRoot,
                                   onPresentD: onPresentD)
        let view = CView(presenter: presenter, viewModel: viewModel)
        return view
    }
}
