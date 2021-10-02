//
//  BCoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation
import SwiftUI
import Combine

protocol BCoordinatorProtocol: Coordinator { }

final class BCoordinator: BCoordinatorProtocol {
    
    func start() -> some View {
        BCoordinatorView(coordinator: self)
    }
    
    struct BCoordinatorView: View {
        let coordinator: BCoordinator
        @State private var topViewTag: String?
        var body: some View {
            return
            VStack {
                NavigationLink(destination: CCoordinator.CCoordinatorView(coordinator: CCoordinator()),
                               tag: CFactory.tag(),
                               selection: $topViewTag) {
                }
                BFactory.make(with: coordinator,
                              onSelected: {
                    topViewTag = CFactory.tag()
                })
            }
        }
    }
}
