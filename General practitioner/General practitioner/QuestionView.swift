//
//  QuestionView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI

enum Answer {
    case yes, no, notSure
}

struct QuestionView: View {
    let bodyPart : BodyPart
    
    let caseData : CaseData
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var yourAnswers = [Answer]()
    
    @State private var matchingCase = Case(name: "Placeholder", description: "Lorem ipsum dolor sir amet", advice: "No advice", answers: [Answer.no])
    
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
                        score = score + 1
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
        NavigationView{
            VStack{
                Text(caseData.questions[questionNumber])
                    .font(.title)
                HStack{
                    Button("YES") {
                        self.answer(answer: Answer.yes)
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
                        self.answer(answer: Answer.no)
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
                    self.answer(answer: Answer.notSure)
                }
                .font(.title2)
                .foregroundColor(.blue)
            }.sheet(isPresented: $showingResult, onDismiss: returnToBody) {
                ResultView(match: self.matchingCase)
            }
        }
    }
}
