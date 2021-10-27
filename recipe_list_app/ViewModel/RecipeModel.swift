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
        // Set the recipes properties
        
    }
}
