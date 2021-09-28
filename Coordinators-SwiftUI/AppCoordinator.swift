//
//  AppCoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 27/9/21.
//

import Foundation
import SwiftUI

// MARK: AppCoordinator

final class AppCoordinator: Coordinator {
    
    @discardableResult
    func start() -> some View {
        return ACoordinator().start()
    }
}
