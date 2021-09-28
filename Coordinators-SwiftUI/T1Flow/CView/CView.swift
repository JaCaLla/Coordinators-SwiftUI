//
//  CView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 1/10/21.
//

import SwiftUI

struct CView: View {
    static let tag = String(describing: CView.self)
    var body: some View {
        Text("C").font(.system(size: 200))
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}

