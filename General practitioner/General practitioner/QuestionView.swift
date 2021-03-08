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

struct CaseData {
    var cases = [Case]()
    var questions = [String]()
}

struct QuestionView: View {
    let bodyPart : BodyPart
    
    var caseData = CaseData()
    
    @State private var yourAnswers = [Answer]()
    
    @State private var questionNumber = 0
    
    func answer(answer: Answer){
        var bestMatch = -1
        var bestCase : Case
        if questionNumber == caseData.questions.count {
            
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
            
        } else {
            self.yourAnswers.append(answer)
            self.questionNumber += 1
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Question \(String(describing: bodyPart))")
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
            }
        }
    }
}
