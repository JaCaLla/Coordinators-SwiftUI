//
//  Coordinator.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 29/9/21.
//
import SwiftUI

protocol Coordinator {
    associatedtype V: View
    func start() -> V
}
