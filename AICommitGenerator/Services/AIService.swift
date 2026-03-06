//
//  AIService.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//

import Foundation

class AIService {
    
    // Replace with your OpenRouter API Key
    private let apiKey = "YOUR_API_KEY"
    
    func generateCommitMessage(diff: String) async throws -> String {
        
        guard let url = URL(string: "https://openrouter.ai/api/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        let prompt = """
        You are a senior software engineer.
        
        Generate a clean git commit message using conventional commits format.
        
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
        
        // Headers required by OpenRouter
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("AICommitGenerator", forHTTPHeaderField: "HTTP-Referer")
        request.addValue("AI Commit Generator", forHTTPHeaderField: "X-Title")
        
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Debug response
        if let json = String(data: data, encoding: .utf8) {
            print("FULL RESPONSE:", json)
        }
        
        let response = try JSONDecoder().decode(OpenRouterResponse.self, from: data)
        
        return response.choices.first?.message.content ?? "No response from AI"
    }
}
