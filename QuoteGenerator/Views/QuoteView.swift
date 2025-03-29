//
//  ContentView.swift
//  QuoteGenerator
//
//  Created by 曾梓恒 on 2025-03-29.
//

import SwiftUI

struct QuoteView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default Quote)
    @State var viewModel = QuoteViewModel()
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    // Starts a timer to wait on revealing button to get new 
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Image("success")
                    .resizable()
                    .scaledToFit()
                    .position(x: UIScreen.main.bounds.width / 2, y: 150)
                
                VStack {
                    
                    // Show a Quote if one exists
                    if let currentQuote = viewModel.currentQuote {
                                                
                        VStack {
                            Text(currentQuote.quote)
                                .padding(.bottom, 20)
                                .font(.title)
                            
                            Text("—— \(currentQuote.author)")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.bottom, 20)
                            
                        }
                        .padding()
                        .multilineTextAlignment(.center)
                        
                        Button {
                            
                            // Hide punchline and button
                            withAnimation {
                                viewModel.currentQuote = nil
                                buttonOpacity = 0.0
                            }
                            
                            // Get a new
                            Task {
                                await viewModel.fetchQuote()
                            }
                            
                            // Restart timers
                            buttonTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                            
                        } label: {
                            
                            Text("New")
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .opacity(buttonOpacity)
                        .onReceive(buttonTimer) { _ in
                            
                            withAnimation {
                                buttonOpacity = 1.0
                            }
                            
                            // Stop the timer
                            buttonTimer.upstream.connect().cancel()
                        }
                    }
                    
                }
                .offset(y: 125)
                .navigationTitle("Best Quotes To WIN")
            }
        }
    }
}
 
#Preview {
    QuoteView()
}
