//
//  QuoteViewModel.swift
//  QuoteGenerator
//
//  Created by 曾梓恒 on 2025-03-29.
//

import Foundation
 
@Observable
class QuoteViewModel {
    
    // MARK: Stored properties
    
    // Whatever Quote has most recently been downloaded
    // from the endpoint
    var currentQuote: Quote?
    
    // MARK: Initializer(s)
    init(currentQuote: Quote? = nil) {
        
        // Take whatever Quote was provided when an instance of
        // this view model is created, and make it the current Quote.
        //
        // Otherwise, the default value for the current Quote
        // will be a nil.
        self.currentQuote = currentQuote
    }
    
}
