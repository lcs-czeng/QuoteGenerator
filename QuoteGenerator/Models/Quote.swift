//
//  Quote.swift
//  QuoteGenerator
//
//  Created by 曾梓恒 on 2025-03-29.
//

import Foundation

struct Quote: Codable {
    let quoteText: String
    let quoteAuthor: String
    let quoteLink: String

}

// Example
let exampleQuote = Quote(
    quoteText: "A man who doesn't trust himself can never really trust anyone else.",
    quoteAuthor: "Cardinal Retz",
    quoteLink: "http://forismatic.com/en/007ae94a6e/"
)
