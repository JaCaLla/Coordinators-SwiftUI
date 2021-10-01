//
//  CCoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation
import SwiftUI
import Combine

protocol CCoordinatorProtocol: Coordinator { }

final class CCoordinator: CCoordinatorProtocol {
    
    func start() -> some View {
        CCoordinatorView(coordinator: self)
    }
    
    struct CCoordinatorView: View {
        let coordinator: CCoordinator
        @State private var topViewTag: String?
        var body: some View {
            return
            VStack {
                NavigationLink(destination: DCoordinator.DCoordinatorView(coordinator: DCoordinator()),
                               tag: DFactory.tag(),
                               selection: $topViewTag) {
                    EmptyView()
                }
                CFactory.make(with: coordinator,
                              onPopToRoot: {
                    NavigationUtil.popToRootView()
                }, onPresentD: {
                    topViewTag = DFactory.tag()
                })
            }
        }
    }
}
