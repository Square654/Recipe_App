//
//  RecipeListView.swift
//  recipe_list_app
//
//  Created by Yanji Tan on 10/25/21.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var model = RecipeModel()
    var body: some View {
        NavigationView {
            List(model.recipes) {r in
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack (spacing: 20) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    })
            }.navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .previewDevice("iPhone 12")
    }
}