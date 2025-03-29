//
//  Quote.swift
//  QuoteGenerator
//
//  Created by 曾梓恒 on 2025-03-29.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id: String  // Using quoteLink as the id
    let quoteText: String
    let quoteAuthor: String
    
    // Custom initializer to set id from quoteLink
    init(
        quoteText: String,
        quoteAuthor: String,
        quoteLink: String
    ) {
        self.id = quoteLink
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
    }
    
    // Since quoteLink is now id, we don’t need it as a separate property
}

// Example
let exampleQuote = Quote(
    quoteText: "A man who doesn't trust himself can never really trust anyone else.",
    quoteAuthor: "Cardinal Retz",
    quoteLink: "http://forismatic.com/en/007ae94a6e/"
)
