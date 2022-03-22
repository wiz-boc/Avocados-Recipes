//
//  SettingsView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = true
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            Form{
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification){
                        Text("Enable notification")
                    }
                    Toggle(isOn: $backgroundRefresh){
                        Text("Background refresh")
                    }
                }
                
                Section {
                    if enableNotification {
                        HStack{
                            Text("Product").foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack{
                            Text("Compatibility").foregroundColor(.gray)
                            Spacer()
                            Text("iPhonen & iPad")
                        }
                        HStack{
                            Text("Developer").foregroundColor(.gray)
                            Spacer()
                            Text("John / Jane")
                        }
                        HStack{
                            Text("Designer").foregroundColor(.gray)
                            Spacer()
                            Text("Kenroy Wiz Gayle")
                        }
                        HStack{
                            Text("Website").foregroundColor(.gray)
                            Spacer()
                            Text("codabablecode.com")
                        }
                        HStack{
                            Text("Version").foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack{
                            Text("Personal message").foregroundColor(.gray)
                            Spacer()
                            Text("Enjoy your 🥑")
                        }
                    }
                    
                } header: {
                    Text("Application")
                }

            }
            
        }
        .frame(maxWidth: 640)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
