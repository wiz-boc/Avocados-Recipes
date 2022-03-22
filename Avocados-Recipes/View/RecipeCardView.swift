//
//  RecipeCardView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/2/21.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModel: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            Spacer()
                        }
                    }
                )
            VStack(alignment: .leading, spacing: 12) {
                //TITLE
                Text(recipe.title)
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                //HEADLINE
                Text(recipe.headline)
                    .font(.system(.body,design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                //RATES
                RecipeRatingView(recipe: recipe)
                
                //Cooking
                RecipeCookingView(recipe: recipe)
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModel = true
        }
        .sheet(isPresented: $showModel) {
            RecipeDetailView(recipe: recipe)
        }

    }
    
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipes[0])
            .previewLayout(.sizeThatFits)
    }
}
