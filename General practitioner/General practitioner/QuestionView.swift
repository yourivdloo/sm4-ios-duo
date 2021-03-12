//
//  QuestionView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

enum Answer : Int, Codable {
    case yes = 1, no = 0, notSure = 2
}

struct QuestionView: View {
    let bodyPart : BodyPart
    
    let caseData : CaseData
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var yourAnswers = [Answer]()
    
    @State private var matchingCase = Case(name: "Placeholder", description: "Lorem ipsum dolor sir amet", advice: "No advice", bodyPart: BodyPart.head, answers: [Answer.no])
    
    @State private var showingResult = false
    
    @State private var questionNumber = 0
    
    func answer(answer: Answer){
        var bestMatch = -1
        var bestCase = matchingCase
        self.yourAnswers.append(answer)
        
        if questionNumber == caseData.questions.count - 1{
            
            for c in caseData.cases {
                var score = 0
                var i = 0
                for a in c.answers {
                    if yourAnswers[i] == Answer.notSure {
                        score += 1
                    }
                    if a == yourAnswers[i] {
                        score += 2
                    }
                    i += 1
                }
                
                if score > bestMatch{
                    bestMatch = score
                    bestCase = c
                }
            }
            
            self.matchingCase = bestCase
            self.showingResult.toggle()
            
        } else {
            self.questionNumber += 1
        }
    }
    
    func returnToBody(){
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        GeometryReader{ geo in
            NavigationView{
                VStack{
                    Text(caseData.questions[questionNumber].question)
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .offset(x: 0.0, y: geo.size.height * -0.2)
                    HStack{
                        Button(action: {self.answer(answer: Answer.yes)}) {
                            Text("YES")
                                .font(.title2)
                                .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                        }
                        .foregroundColor(.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 1)
                        )
                        .offset(x: 0.0, y: geo.size.height * -0.1)
                        
                        Button(action: {self.answer(answer: Answer.no)}) {
                            Text("NO")
                                .font(.title2)
                                .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 1)
                        )
                        .offset(x: 0.0, y: geo.size.height * -0.1)
                    }
                    Button("Not sure") {
                        self.answer(answer: Answer.notSure)
                    }
                    .padding()
                    .font(.title2)
                    .foregroundColor(.blue)
                    .offset(x: 0.0, y: geo.size.height * -0.1)
                }.sheet(isPresented: $showingResult, onDismiss: returnToBody) {
                    ResultView(match: self.matchingCase, savedMatch: nil, timeSaved: nil, isSaved: false)
                }
            }
        }
    }
}
