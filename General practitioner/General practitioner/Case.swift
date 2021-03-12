//
//  Case.swift
//  General practitioner
//
//  Created by youri van der loo on 3/8/21.
//

import Foundation

enum CodingKeys: CodingKey {
    case name, description, advice, bodyPart, answers
}

class Case : Codable, Hashable {
    static func == (lhs: Case, rhs: Case) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description && lhs.advice == rhs.advice && lhs.bodyPart == rhs.bodyPart && lhs.answers == rhs.answers
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    let name: String
    let description: String
    let advice: String
    let bodyPart : BodyPart
    let answers: [Answer]
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(advice, forKey: .advice)
        try container.encode(bodyPart, forKey: .bodyPart)
        try container.encode(answers, forKey: .answers)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        advice = try container.decode(String.self, forKey: .advice)
        bodyPart = try container.decode(BodyPart.self, forKey: .bodyPart)
        answers = try container.decode(Array.self, forKey: .answers)
    }
    
    init(name:String, description:String, advice:String, bodyPart:BodyPart, answers:[Answer]){
        self.name = name
        self.description = description
        self.advice = advice
        self.bodyPart = bodyPart
        self.answers = answers
    }
}
