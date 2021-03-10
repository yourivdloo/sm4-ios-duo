//
//  History.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

enum BodyPart : String {
    case foot = "foot", lowerLeg = "lower leg", knee = "knee", upperLeg = "upper leg", belly = "belly", hand = "hand", arm = "arm", shoulder = "shoulder", head = "head", eye = "eye", nose = "nose", ear = "ear", neck = "neck", chest = "chest"
}

struct BodyView : View {
    
    @State private var showingHeadOptions = false
    
    @State private var showingQuestion = false
    
    @State private var bodyPart = BodyPart.head

    @State private var size : CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                ZStack{
                    VStack{
                        //            Text("Where do you ache?")
                        //                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Image("body")
                            .resizable()
                            .padding([.horizontal], -80)
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.9)
                    }
                    Group{
                        Button("Head"){
                            self.showingHeadOptions.toggle()
                        }
                        .frame(width: geo.size.height * 0.21, height: geo.size.height * 0.21)
                        .background(Color.blue)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: geo.size.width * -0.0175, y: geo.size.height * -0.335)
                        
                        Btn(bodyPart: BodyPart.hand, size: size)
                            .offset(x: geo.size.width * 0.33, y: geo.size.height * 0.02)
                        
                        Btn(bodyPart: BodyPart.arm, size: size)
                            .offset(x: geo.size.width * 0.19, y: geo.size.height * -0.08)
                        
                        Btn(bodyPart: BodyPart.shoulder, size: size)
                            .offset(x: geo.size.width * 0.1, y: geo.size.height * -0.18)
                        
                        Btn(bodyPart: BodyPart.knee, size: size)
                            .offset(x: geo.size.width * -0.2, y: geo.size.height * 0.2)
                        
                        Btn(bodyPart: BodyPart.upperLeg, size: size)
                            .offset(x: geo.size.width * -0.13, y: geo.size.height * 0.1)
                        
                        Btn(bodyPart: BodyPart.belly, size: size)
                            .offset(x: geo.size.width * -0.01, y: geo.size.height * -0.02)
                        
                        Btn(bodyPart: BodyPart.chest, size: size)
                            .offset(x: geo.size.width * -0.07, y: geo.size.height * -0.15)
                        
                        Btn(bodyPart: BodyPart.lowerLeg, size: size)
                            .offset(x: geo.size.width * 0.08, y: geo.size.height * 0.2)
                        
                        Btn(bodyPart: BodyPart.foot, size: size)
                            .offset(x: geo.size.width * 0.11, y: geo.size.height * 0.35)
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
            .onAppear(perform: { self.size = geo.size.height * 0.14})
        }
    }
    
}

struct Btn : View{
    let bodyPart : BodyPart
    let size: CGFloat
    
    var body: some View {
        NavigationLink(destination: QuestionView(bodyPart: bodyPart, caseData: CaseData(bodyPart: bodyPart))){
            Text(String(describing: bodyPart.rawValue))
        }
        
        .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
