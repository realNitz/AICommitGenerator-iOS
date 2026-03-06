//
//  AIService.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//

import Foundation

class AIService {
    
    private let apiKey = "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"
    
    func generateCommitMessage(diff: String) async throws -> String {
        
        guard let url = URL(string: "https://openrouter.ai/api/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        let prompt = """
        Generate a git commit message using conventional commit format.

        Git diff:
        \(diff)

        Return:
        Title
        Bullet points
        """
        
        let body: [String: Any] = [
            "model": "openai/gpt-3.5-turbo",
            "messages": [
                [
                    "role": "user",
                    "content": prompt
                ]
            ]
        ]
        
        let jsonData = try JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let json = String(data: data, encoding: .utf8) {
            print("FULL RESPONSE:", json)
        }
        
        let response = try JSONDecoder().decode(AIResponse.self, from: data)
        
        return response.choices.first?.message.content ?? "No response"
        
    }
}
