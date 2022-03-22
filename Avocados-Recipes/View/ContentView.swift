//
//  ContentView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    var headers = headersData
    var facts = factsData
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center,spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { header in
                            HeaderView(header: header)
                        }
                        //Text("Headers")
                    }
                }
                
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                DishesView()
                    .frame(maxWidth: 640)
                
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts){
                            FactsView(fact: $0)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                //MARK: - RECIPE CARDS
                
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes){
                        RecipeCardView(recipe: $0)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                VStack(alignment: .center, spacing: 20) {
                   
                    Text("All About Avocadas")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                        
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body,design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
