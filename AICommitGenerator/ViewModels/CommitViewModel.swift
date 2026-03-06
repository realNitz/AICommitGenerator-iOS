//
//  CommitViewModel.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//

import Foundation
import Combine

class CommitViewModel: ObservableObject {

    @Published var codeDiff: String = ""
    @Published var commitMessage: String = ""
    @Published var isLoading = false

    private let aiService = AIService()

    func generateCommit() {

        guard !codeDiff.isEmpty else {
            commitMessage = "Please enter code changes"
            return
        }

        isLoading = true

        Task {
            do {

                let result = try await aiService.generateCommitMessage(diff: codeDiff)

                DispatchQueue.main.async {
                    self.commitMessage = result
                    self.isLoading = false
                }

            } catch {

                DispatchQueue.main.async {
                    self.commitMessage = "Error generating commit message"
                    self.isLoading = false
                }

            }
        }
    }
}
