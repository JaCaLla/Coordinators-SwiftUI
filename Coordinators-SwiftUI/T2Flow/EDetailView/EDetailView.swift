//
//  EDetailView.swift
//  Coordinators-SwiftUI
//
//  Created by Javier Calatrava on 4/10/21.
//

import SwiftUI

struct EDetailView: View {
    @Binding var showingDetail: Bool
    var body: some View {
        VStack{
            Text(" EDetailView ")
            Button(action: {
                showingDetail.toggle()
            }) {
                Text("Back")
            }
            Button {
                print("todo")
            } label: {
                Text("Go to A")
            }
            Button {
                print("todo")
            } label: {
                Text("Go to F")
            }
        }
       
    }
}

struct EDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EDetailView(showingDetail: .constant(false))
    }
}
