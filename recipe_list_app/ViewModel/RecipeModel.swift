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
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Get a single serving size by multiplying denominator by serving size
            
            denominator = denominator * recipeServings
            // Get target portion by multiplying numerator by target servings
            
            numerator = numerator * targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator = numerator / divisor
            denominator = denominator / divisor
            
            // Get whole portions if numerator > demoninator
            if numerator >= denominator {
                
                // Calculate the whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign portion to string
                portion = String(wholePortions)
                
            }
            
            // Express remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as a fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
        }
        // Check if the unit is plural or singular
        if var unit = ingredient.unit {
            //  Check for appropriate suffix
            if wholePortions > 1 {
                // Check some common suffixes
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                
                else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
}
