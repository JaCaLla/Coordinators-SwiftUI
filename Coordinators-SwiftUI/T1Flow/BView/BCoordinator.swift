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
            Group {
                NavigationLink(destination: CView(),
                               tag: "C",
                               selection: $topViewTag) {
                    BFactory.make(with: coordinator,
                                  onSelected: {
                        topViewTag = "C"
                    })
                }
            }
        }
    }
}
