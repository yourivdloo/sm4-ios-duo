//
//  Question.swift
//  General practitioner
//
//  Created by Pim van Hooren on 12/03/2021.
//

import Foundation

enum CodingKeysQ: CodingKey {
    case question, bodyPart
}

class Question : Codable, Hashable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.question == rhs.question && lhs.bodyPart == rhs.bodyPart
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(question)
    }
    
    let question: String
    let bodyPart : BodyPart
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeysQ.self)

        try container.encode(question, forKey: .question)
        try container.encode(bodyPart, forKey: .bodyPart)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysQ.self)

        question = try container.decode(String.self, forKey: .question)
        bodyPart = try container.decode(BodyPart.self, forKey: .bodyPart)
    }
    
    init(question:String, bodyPart:BodyPart){
        self.question = question
        self.bodyPart = bodyPart
    }
}
