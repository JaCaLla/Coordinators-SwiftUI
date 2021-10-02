//
//  DCoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import Foundation
import SwiftUI
import Combine

protocol DCoordinatorProtocol: Coordinator { }

final class DCoordinator: DCoordinatorProtocol {
    
    func start() -> some View {
        DCoordinatorView(coordinator: self)
    }
    
    struct DCoordinatorView: View {
        let coordinator: DCoordinator
        @State private var topViewTag: String?
        var body: some View {
            return
            Group {
                DFactory.make(with: coordinator,
                              onPopToRoot: {
                    NavigationUtil.popToRootView()
                })
            }
        }
    }
}
