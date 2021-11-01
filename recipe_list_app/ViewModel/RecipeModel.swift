//
//  RecipeModel.swift
//  recipe_list_app
//
//  Created by Yanji Tan on 10/25/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredients, recipeServings:Int, targetServings:Int) -> String {
        // Get a single serving size by multiplying denominator by serving size
        
        // Get target portion by multiplying numerator by target servings
        
        // Reduce fraction by greatest common divisor
        
        // Get whole portions if numerator > demoninator
        return String(targetServings)
    }
}
