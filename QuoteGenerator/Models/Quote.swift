//
//  Quote.swift
//  QuoteGenerator
//
//  Created by 曾梓恒 on 2025-03-29.
//

import Foundation

struct Quote: Identifiable, Codable {
    let quote: String
    let author: String
    let id: Int

}

// Example
let exampleQuote = Quote(
    quote: "The secret of success is to do the common thing uncommonly well.",
    author: "John D. Rockefeller Jr.",
    id: 19
)
