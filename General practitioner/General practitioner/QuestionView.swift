//
//  QuestionView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack{
        Text("Question")
            .font(.title)
            HStack{
                Button("YES") {
                }
                .font(.title2)
                .frame(width: 150, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.green)
                .padding()
                .overlay(
                  RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 1)
                )
                Button("NO") {
                }
                .font(.title2)
                .frame(width: 150, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.red)
                .padding()
                .overlay(
                  RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.red, lineWidth: 1)
                )
            }
            Button("Not sure") {
            }
            .font(.title2)
            .foregroundColor(.blue)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
