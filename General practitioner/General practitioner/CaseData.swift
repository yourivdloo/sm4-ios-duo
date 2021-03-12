//
//  CaseData.swift
//  General practitioner
//
//  Created by Pim van Hooren on 09/03/2021.
//

import Foundation

struct CaseData {
    var cases = [Case]()
    var questions = [Question]()
    
    init(bodyPart : BodyPart){
        if let casesURL = Bundle.main.url(forResource: "cases", withExtension: "txt") {
            if let startCases = try? String(contentsOf: casesURL) {
                let allCases = startCases.components(separatedBy: "@\n")
                
                var decodedCases = [Case]()
                
                for encodedCase in allCases{
                    if let decodedCase = try? JSONDecoder().decode(Case.self, from: encodedCase.data(using: .utf8)!) {
                        decodedCases.append(decodedCase)
                    }
                }
                
                for decodedCase in decodedCases{
                    if(decodedCase.bodyPart == bodyPart){
                        cases.append(decodedCase)
                    }
                }
            }
        }
        
        if let questionsURL = Bundle.main.url(forResource: "questions", withExtension: "txt") {
            if let startQuestions = try? String(contentsOf: questionsURL) {
                let allQuestions = startQuestions.components(separatedBy: "@\n")
                
                var decodedQuestions = [Question]()
                
                for encodedQuestion in allQuestions{
                    if let decodedQuestion = try? JSONDecoder().decode(Question.self, from: encodedQuestion.data(using: .utf8)!) {
                        decodedQuestions.append(decodedQuestion)
                    }
                }
                
                for decodedQuestion in decodedQuestions{
                    if(decodedQuestion.bodyPart == bodyPart){
                        questions.append(decodedQuestion)
                    }
                }
            }
        }
    }
}
