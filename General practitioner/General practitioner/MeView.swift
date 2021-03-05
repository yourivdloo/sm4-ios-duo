//
//  BodyView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        NavigationView{
            List{
                Text("History item 1")
                Text("History item 2")
                Text("History item 3")
            }.navigationBarTitle("Me")
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
