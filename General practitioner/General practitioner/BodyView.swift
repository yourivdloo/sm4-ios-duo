//
//  History.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

enum BodyPart {
    case foot, lowerLeg, knee, upperLeg, belly, hand, arm, shoulder, head, chest
}

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
                Group{
                    Btn(bodyPart: BodyPart.hand, size: 75)
                        .offset(x: 150, y: 0.0)
                    
                    Btn(bodyPart: BodyPart.arm, size: 75)
                        .offset(x: 78, y: -72.0)
                    
                    Btn(bodyPart: BodyPart.shoulder, size: 75)
                        .offset(x: 30, y: -155.0)
                    
                    Btn(bodyPart: BodyPart.head, size: 150)
                        .offset(x: -7.0, y: -265.0)
                    
                    Btn(bodyPart: BodyPart.knee, size: 75)
                        .offset(x: -93.0, y: 155)
                    
                    Btn(bodyPart: BodyPart.upperLeg, size: 75)
                        .offset(x: -50.0, y: 60)
                    
                    Btn(bodyPart: BodyPart.belly, size: 75)
                        .offset(x: -7.0, y: -30)
                    
                    Btn(bodyPart: BodyPart.chest, size: 75)
                        .offset(x: -35.0, y: -115)
                    
                    Btn(bodyPart: BodyPart.lowerLeg, size: 75)
                        .offset(x: 35.0, y: 160)
                    
                    Btn(bodyPart: BodyPart.foot, size: 75)
                        .offset(x: 50.0, y: 270)
                }
            }
            .navigationBarTitle("Where do you ache?")
        }
    }
}

struct Btn : View{
    let bodyPart : BodyPart
    
    let size : CGFloat
    var body: some View {
        NavigationLink(destination: QuestionView(bodyPart: bodyPart, caseData: CaseData(bodyPart: bodyPart))){
                    Text(String(describing: bodyPart))
                }
        .frame(width: self.size, height: self.size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.blue)
        .opacity(0.5)
        .foregroundColor(.white)
        .clipShape(Circle())
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
