//
//  DataService.swift
//  recipe_list_app
//
//  Created by Yanji Tan on 10/25/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local JSON file
        
        // Get a url path to JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // Check if pathString is not nil
        guard pathString != nil else {
            return [Recipe]()
        }
        // Create url object
        let url = URL(fileURLWithPath: pathString!)
        do {
            // Create data object
            let data = try Data(contentsOf: url)
            // Decode the data with a JSON Decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add unique ID's
                for r in recipeData {
                    r.id = UUID()
                    // Add unique ID's for the ingredients array
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // Return the recipes
                return recipeData
            }
            catch {
                // Error with parsing JSON
                print(error)
            }
        }
        catch {
            // Error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
