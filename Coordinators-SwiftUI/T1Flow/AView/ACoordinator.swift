//
//  RootACoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 26/9/21.
//

import Foundation
import SwiftUI
import Combine

protocol ACoordinatorProtocol: Coordinator { }

final class ACoordinator: ACoordinatorProtocol {
    
    func start() -> some View {
        return ACoordinatorView(coordinator: self)
    }
    
    struct ACoordinatorView: View {
        let coordinator: ACoordinator
        @State private var topViewTag: String?
        var body: some View {
            return NavigationView {
                Group {
                    NavigationLink(destination:
                                   BCoordinator.BCoordinatorView(coordinator: BCoordinator()),
                                   tag: "B",
                                   selection: $topViewTag) {
                        AFactory.make(with: coordinator,
                                      onSelected: {
                            topViewTag = "B"
                        })
                    }
                }
            }
        }
    }
}
