//
//  AIResponse.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//

import Foundation

struct OpenRouterResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: Message
}

struct Message: Codable {
    let role: String
    let content: String
}
