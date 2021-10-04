//
//  EView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 4/10/21.
//

import SwiftUI
import Combine

struct EView<T: EPresenterProtocol, VM: EViewModelProtocol>: View {
    
    @ObservedObject var presenter: T
    @ObservedObject var viewModel: VM
    @State private var showingDetail = false
    var onPresentModal: () -> Void = {
        
    }
    var body: some View {
        VStack {
            Text(viewModel.runCountStr).font(.system(size: 200))
            Button {
                self.presenter.onPresentModal(onPresentingModal: {
                    showingDetail.toggle()
                })
            } label: {
                Text("PresentModal")
            }.padding()
        }
        .sheet(isPresented: $showingDetail) {
            EDetailView(showingDetail: $showingDetail)
                    }
        .navigationTitle("A Navigation bar")
    }
    
    func presentModal() {
        onPresentModal()
    }
}

struct ViewE_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = ACoordinator()
        return AFactory.make(with: coordinator, onSelected: {})
    }
}

enum EFactory {
    static func make(with coordinator: ECoordinator, onSelected: @escaping () -> Void) -> some View {
        let viewModel = EViewModel()
        let presenter = EPresenter(viewModel: viewModel,
                                   onSelected: onSelected)
        presenter.view =  EView(presenter: presenter, viewModel: viewModel)
        return  presenter.view
    }
}
