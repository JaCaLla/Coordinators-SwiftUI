//
//  AppCoordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 27/9/21.
//
//https://stackoverflow.com/questions/62504400/programmatically-change-to-another-tab-in-swiftui
import Foundation
import SwiftUI

// MARK: AppCoordinator
struct CurrentTabKey: EnvironmentKey {
    static var defaultValue: Binding<AppCoordinator.Tab> = .constant(.linear)
}

extension EnvironmentValues {
    var currentTab: Binding<AppCoordinator.Tab> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
}

final class AppCoordinator: Coordinator {
    
    enum Tab {
        case linear
        case branch
    }
    
    @discardableResult
    func start() -> some View {
        return AppCoordinatorView()
    }
    
    struct AppCoordinatorView: View {

        @State private var selectedTab: Tab = .linear
        var body: some View {
            TabView(selection: $selectedTab) {
                ACoordinator().start()
                    .tabItem {
                        Image(systemName: "circle")
                        Text("Linear")
                    }
                    .tag(Tab.linear)
                    .environment(\.currentTab, $selectedTab)
                ECoordinator().start()
                    .tag(Tab.branch)
                    .tabItem {
                        Image(systemName: "square")
                        Text("Branch")
                    }
            }
        }
    }
}
