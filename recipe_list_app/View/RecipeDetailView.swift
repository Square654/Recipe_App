//
//  SwiftUIView.swift
//  recipe_list_app
//
//  Created by Yanji Tan on 10/27/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(recipe.ingredients)
                        {r in
                        Text("• " + r.name)
                    }
                }.padding(.horizontal, 10)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack (alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                        .padding([.leading, .trailing], 10)
                    ForEach(0..<recipe.directions.count, id: \.self)
                        {index in
                        Text(String(index + 1) + ". " +  recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal, 10)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
            .previewDevice("iPhone 12")
    }
}
