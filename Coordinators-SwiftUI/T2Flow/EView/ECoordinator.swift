//
//  ECoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 4/10/21.
//

import Foundation
import SwiftUI
import Combine

protocol ECoordinatorProtocol: Coordinator { }

final class ECoordinator: ECoordinatorProtocol {
    
    func start() -> some View {
        return ECoordinatorView(coordinator: self)
    }
    
    struct ECoordinatorView: View {
        let coordinator: ECoordinator
        @State private var topViewTag: String?
        var body: some View {
            return NavigationView {
                VStack {
//                    NavigationLink(destination:
//                                   BCoordinator.BCoordinatorView(coordinator: BCoordinator()),
//                                   tag: BPresenter.tag(),
//                                   selection: $topViewTag) {
//                        EmptyView()
//                    }
                    EFactory.make(with: coordinator,
                                  onSelected: {
                        topViewTag = EPresenter.tag()
                    })
                }
            }
        }
    }
}
