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
            ZStack{
            VStack{
                //            Text("Where do you ache?")
                //                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Image("body")
                    .resizable()
                    .padding([.horizontal], -80)
            }
                    Button("Hand"){}
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: 150, y: 0.0)
                        
                    Button("Arm"){}
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: 78, y: -72.0)
                    
                    Button("Shoulder"){}
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: 30, y: -160.0)
                
                Button("Head"){}
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: -7.0, y: -270.0)
                
                Button("Knee"){}
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: -93.0, y: 155)
                
                Button("Hip"){}
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: -50.0, y: 40)
                
                Button("Belly"){}
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: -7.0, y: -50)
                
                Button("Leg"){}
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: 30.0, y: 90)
                
                Button("Foot"){}
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: 50.0, y: 280)
        }
            .navigationBarTitle("Where do you ache?")
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
