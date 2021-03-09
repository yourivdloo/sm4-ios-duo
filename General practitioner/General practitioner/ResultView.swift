//
//  ResultView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct ResultView: View {
    let match : Case
    
    var body: some View {
        Text(match.name).font(.title)
        Text(match.description)
        Text(match.advice)
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
