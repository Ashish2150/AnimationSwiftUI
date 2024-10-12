//
//  Recipe.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 28/09/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Recipe {
    @Attribute(.unique) var id: Int
    var name: String
    var ingredients: [String]
    
    init(id: Int, name: String, ingredients: [String]) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
    }
}
