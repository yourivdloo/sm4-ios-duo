//
//  ResultView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct ResultView: View {
    let match : Case
    let bodyPart : BodyPart
    
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                VStack{
                    Image(String(describing: bodyPart))
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("We think you might have \(match.name)")
                    Text(match.advice)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add to My history")
                        Image(systemName: "clock.arrow.circlepath")
                    })
                    .foregroundColor(.white)
                    
                    
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    Spacer()
                }
                .navigationBarTitle(match.name)
            }
        }
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
