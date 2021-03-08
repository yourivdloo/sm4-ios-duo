//
//  Case.swift
//  General practitioner
//
//  Created by youri van der loo on 3/8/21.
//

import Foundation

struct Case {
    let name: String
    let description: String
    let advice: String
    let answers = [Answer]()
}
