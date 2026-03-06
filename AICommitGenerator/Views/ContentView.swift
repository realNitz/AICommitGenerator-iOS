//
//  ContentView.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CommitViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Paste Git Diff")
                    .font(.headline)
                
                TextEditor(text: $viewModel.codeDiff)
                    .frame(height: 200)
                    .border(Color.gray)
                    .padding(.horizontal)
                
                Button(action: {
                    viewModel.generateCommit()
                }) {
                    Text("Generate Commit Message")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                
                Text("Generated Commit Message")
                    .font(.headline)
                
                
                ScrollView {
                    Text(viewModel.commitMessage)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("AI Commit Generator")
        }
    }
}

#Preview {
    ContentView()
}
