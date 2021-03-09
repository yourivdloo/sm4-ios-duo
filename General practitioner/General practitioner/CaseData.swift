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
        let canYouFeel = "Can you still feel your \(bodyPart)?"
        let canYouMove = "Can you still move your \(bodyPart) without too much pain?"
        let temperature = "Do you have a high temperature?"
        
        switch(bodyPart){
        case .knee:
            cases.append(Case(name: "Broken knee", description: "You broke your knee", advice: "Go visit your GP", answers: [Answer.yes]))
            cases.append(Case(name: "Perfectly fine", description: "There's nothing on the hand", advice: "No need to visit GP", answers: [Answer.no]))
            questions.append("Does your knee feel broken?")
            questions.append(canYouMove)
        case .lowerLeg:
            cases.append(Case(name: "Broken lower leg", description: "You broke your lower leg", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouFeel)
        case .upperLeg:
            cases.append(Case(name: "Broken upper leg", description: "You broke your upper leg", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouFeel)
        case .foot:
            cases.append(Case(name: "Broken foot", description: "You broke your foot", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouFeel)
            questions.append(canYouMove)
        case .belly:
            cases.append(Case(name: "Stomach flu", description: "You have stomach flu", advice: "Stay at home and run its course first", answers: [Answer.yes, Answer.no, Answer.yes]))
            cases.append(Case(name: "Constipation", description: "You are suffering of constipation", advice: "You can sit it out, or you can get a laxative from your local pharmacy", answers: [Answer.yes, Answer.no, Answer.no]))
            questions.append("Do you experience stomach cramps?")
            questions.append("Do you see a wound?")
            questions.append(temperature)
        case .chest:
            cases.append(Case(name: "Heart attack", description: "You may or may not have a heart attack, go find help", advice: "It might be smart to go find direct help, rather than a GP", answers: [Answer.yes]))
            questions.append("Do you feel pressure on your chest?")
            questions.append(temperature)
        case .arm:
            cases.append(Case(name: "Broken arm", description: "You broke your arm", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouFeel)
            questions.append(canYouMove)
        case .hand:
            cases.append(Case(name: "Broken hand", description: "You broke your hand", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouFeel)
            questions.append(canYouMove)
        case .shoulder:
            cases.append(Case(name: "Broken shoulder", description: "You broke your shoulder", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouMove)
        case .head:
            cases.append(Case(name: "Corona virus", description: "You may have been affected with COVID-19", advice: "Get a test and isolate", answers: [Answer.no]))
            questions.append(temperature)
        case .nose:
            cases.append(Case(name: "Broken nose", description: "Your nose is probably broken", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouMove)
        case .eye:
            cases.append(Case(name: "Hay fever", description: "There are pollens in the air and you might have hay fever", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append("Do your eyes feel warm?")
        case .ear:
            cases.append(Case(name: "Eardrum inflammation", description: "You may have been affected with too much noise", advice: "Go visit your GP for examination", answers: [Answer.no]))
            questions.append("Do you hear a constant high frequency?")
        case .neck:
            cases.append(Case(name: "Broken neck", description: "description", advice: "Go visit your GP", answers: [Answer.no]))
            questions.append(canYouMove)
        }
    }
}
