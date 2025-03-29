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
    @State var viewModel = QuoteViewModel(currentQuote: exampleQuote)
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a Quote if one exists
            if let currentQuote = viewModel.currentQuote {
                
                VStack {
                    Text(currentQuote.quoteText)
                        .padding(.bottom, 20)
                        .font(.title)
                    
                    Text("—— \(currentQuote.quoteAuthor)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)

                }
                .padding()
                .multilineTextAlignment(.center)
            }
            
        }
    }
}
 
#Preview {
    QuoteView()
}
