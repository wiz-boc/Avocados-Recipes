//
//  Recipe.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/2/21.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let image: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
    
}

