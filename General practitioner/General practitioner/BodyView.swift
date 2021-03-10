//
//  History.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

enum BodyPart : String {
    case foot = "foot", lowerLeg = "lowerLeg", knee = "knee", upperLeg = "upperLeg", belly = "belly", hand = "hand", arm = "arm", shoulder = "shoulder", head = "head", eye = "eye", nose = "nose", ear = "ear", neck = "neck", chest = "chest"
}

struct BodyView : View {
    
    @State private var showingHeadOptions = false
    
    @State private var showingQuestion = false
    
    @State private var bodyPart = BodyPart.head
    
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
                    Btn(bodyPart: BodyPart.hand)
                        .offset(x: 145, y: 10.0)
                    
                    Btn(bodyPart: BodyPart.arm)
                        .offset(x: 78, y: -72.0)
                    
                    Btn(bodyPart: BodyPart.shoulder)
                        .offset(x: 35, y: -137.5)
                    
                    Button("Head"){
                        self.showingHeadOptions.toggle()
                    }
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x: -7.0, y: -250.0)
                    
                    Btn(bodyPart: BodyPart.knee)
                        .offset(x: -93.0, y: 155)
                    
                    Btn(bodyPart: BodyPart.upperLeg)
                        .offset(x: -50.0, y: 60)
                    
                    Btn(bodyPart: BodyPart.belly)
                        .offset(x: -7.0, y: -30)
                    
                    Btn(bodyPart: BodyPart.chest)
                        .offset(x: -35.0, y: -115)
                    
                    Btn(bodyPart: BodyPart.lowerLeg)
                        .offset(x: 35.0, y: 160)
                    
                    Btn(bodyPart: BodyPart.foot)
                        .offset(x: 50.0, y: 270)
                }
                NavigationLink(destination: QuestionView(bodyPart: self.bodyPart, caseData: CaseData(bodyPart: self.bodyPart)),
                               isActive: $showingQuestion) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Where do you ache?")
            .actionSheet(isPresented: $showingHeadOptions){
                ActionSheet(title: Text("Where on your head do you ache?"), buttons: [
                    .default(Text("Head(general)")) {
                        self.bodyPart = BodyPart.head
                        self.showingQuestion.toggle()
                    },
                    .default(Text("Eye(s)")) {
                        self.bodyPart = BodyPart.eye
                        self.showingQuestion.toggle()
                    },
                    .default(Text("Nose")) {
                        self.bodyPart = BodyPart.nose
                        self.showingQuestion.toggle()
                    },
                    .default(Text("Ear(s)")) {
                        self.bodyPart = BodyPart.ear
                        self.showingQuestion.toggle()
                    },
                    .default(Text("Neck")) {
                        self.bodyPart = BodyPart.neck
                        self.showingQuestion.toggle()
                    },
                    .cancel()
                ])
            }
            
        }
    }
}

struct Btn : View{
    let bodyPart : BodyPart
    var body: some View {
        NavigationLink(destination: QuestionView(bodyPart: bodyPart, caseData: CaseData(bodyPart: bodyPart))){
            Text(String(describing: bodyPart))
        }
        .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
