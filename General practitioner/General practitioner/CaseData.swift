//
//  CaseData.swift
//  General practitioner
//
//  Created by Pim van Hooren on 09/03/2021.
//

import Foundation

struct CaseData {
//    let bodyPart : BodyPart
    
    var cases = [Case]()
    var questions = [String]()
    
    init(bodyPart : BodyPart){
        switch(bodyPart){
        case .knee:
            cases.append(Case(name: "Broken knee", description: "You broke your knee", advice: "Go visit your GP", answers: [Answer.yes]))
            cases.append(Case(name: "Perfectly fine", description: "There's nothing on the hand", advice: "No need to visit GP", answers: [Answer.no]))
            questions.append("Does your knee feel broken?")
        case .lowerLeg:
            cases.append(Case(name: "Broken lower leg", description: "You broke your lower leg", advice: "Go visit your GP", answers: [Answer.no]))
        case .upperLeg:
            cases.append(Case(name: "Broken upper leg", description: "You broke your upper leg", advice: "Go visit your GP", answers: [Answer.no]))
        case .foot:
            cases.append(Case(name: "Broken foot", description: "You broke your foot", advice: "Go visit your GP", answers: [Answer.no]))
        case .belly:
            cases.append(Case(name: "Stomach flu", description: "You have stomach flu", advice: "Stay at home and run its course first", answers: [Answer.no]))
        case .chest:
            cases.append(Case(name: "", description: "You broke your knee", advice: "Go visit your GP", answers: [Answer.no]))
        case .arm:
            cases.append(Case(name: "Broken arm", description: "You broke your arm", advice: "Go visit your GP", answers: [Answer.no]))
        case .hand:
            cases.append(Case(name: "Broken hand", description: "You broke your hand", advice: "Go visit your GP", answers: [Answer.no]))
        case .shoulder:
            cases.append(Case(name: "Broken shoulder", description: "You broke your shoulder", advice: "Go visit your GP", answers: [Answer.no]))
        case .head:
            cases.append(Case(name: "Corona virus", description: "You may have been affected with COVID-19", advice: "Get a test and isolate", answers: [Answer.no]))
        }
    }
}
