//
//  Ripening.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/3/21.
//

import SwiftUI


struct Ripening: Identifiable {
    let id = UUID()
    let image: String
    let stage: String
    let title: String
    let description: String
    let ripeness: String
    let instruction: String
}
