//
//  RecipeDetailView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/2/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State private var pulsate = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(recipe.image)
                    .resizable()
                .scaledToFit()
                
                Group {
                    //TITLE
                    Text(recipe.title)
                        .font(.system(.largeTitle,design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    //RATING
                    RecipeRatingView(recipe: recipe)
                    //COOKING
                    RecipeCookingView(recipe: recipe)
                    //INGREDIENTS
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self){ ingredient in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(ingredient)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    ForEach(recipe.instructions, id: \.self){ instruction in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(instruction)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(
            HStack {
                Spacer()
                VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    
                        Spacer()
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                        .opacity(pulsate ? 1 : 0.6)
                        .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                        .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
        )
        .onAppear{
            pulsate.toggle()
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipes[0])
    }
}
