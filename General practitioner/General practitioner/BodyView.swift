//
//  History.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct BodyView : View {
    var body: some View {
        NavigationView{
            
            Image("beter").resizable()
                .scaledToFit()
                .navigationBarTitle("General practitioner")
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
