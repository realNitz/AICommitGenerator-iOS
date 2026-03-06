//
//  ContentView.swift
//  AICommitGenerator
//
//  Created by Nitesh Parihar on 06/03/26.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = CommitViewModel()
    
    var body: some View {
        
        ZStack {
            
            // Background Gradient
            LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 25) {
                    
                    // Title
                    VStack(spacing: 5) {
                        Text("AI Commit Generator")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Generate clean git commit messages using AI")
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    
                    // Diff Input Card
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Paste Git Diff")
                            .font(.headline)
                        
                        TextEditor(text: $viewModel.codeDiff)
                            .frame(height: 180)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    
                    // Generate Button
                    Button {
                        Task {
                            await viewModel.generateCommit()
                        }
                    } label: {
                        Text("Generate Commit Message")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    
                    // Loading
                    if viewModel.isLoading {
                        ProgressView("Generating...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.white)
                    }
                    
                    
                    // Result Card
                    if !viewModel.commitMessage.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Generated Commit")
                                .font(.headline)
                            
                            Text(viewModel.commitMessage)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            
                            
                            Button {
                                UIPasteboard.general.string = viewModel.commitMessage
                            } label: {
                                Text("Copy Commit")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }
                    
                }
                .padding(.top, 40)
            }
        }
    }
}
#Preview {
    ContentView()
}
