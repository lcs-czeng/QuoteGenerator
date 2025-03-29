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
        
               // Load a Quote from the endpoint
               Task {
                   await self.fetchQuote()
               }
           }
           
           // MARK: Function(s)
           
           // This loads a new Quote from the endpoint
           //
           // "async" means it is an asynchronous function.
           //
           // That means it can be run alongside other functionality
           // in our app. Since this function might take a while to complete
           // this ensures that other parts of our app, such as the user
           // interface, won't "freeze up" while this function does it's job.
           func fetchQuote() async {
               
               // 1. Attempt to create a URL from the address provided
               let endpoint = "https://random-quotes-freeapi.vercel.app/api/random"
               guard let url = URL(string: endpoint) else {
                   print("Invalid address for JSON endpoint.")
                   return
               }
               
               // 2. Fetch the raw data from the URL
               //
               // Network requests can potentially fail (throw errors) so
               // we complete them within a do-catch block to report errors
               // if they occur.
               //
               do {
                   
                   // Fetch the data
                   let (data, _) = try await URLSession.shared.data(from: url)
        
                   // Print the received data in the debug console
                   print("Got data from endpoint, contents of response are:")
                   print(String(data: data, encoding: .utf8)!)
                   
                   // 3. Decode the data into a Swift data type
                   
                   // Create a decoder object to do most of the work for us
                   let decoder = JSONDecoder()
                   
                   // Use the decoder object to convert the raw data
                   // into an instance of our Swift data type
                   let decodedData = try decoder.decode(Quote.self, from: data)
                   
                   // If we got here, decoding succeeded,
                   // return the instance of our data type
                   self.currentQuote = decodedData
                   
               } catch {
                   
                   // Show an error that we wrote and understand
                   print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
                   print("----")
                   
                   // Show the detailed error to help with debugging
                   print(error)
                   
               }
           }
}
