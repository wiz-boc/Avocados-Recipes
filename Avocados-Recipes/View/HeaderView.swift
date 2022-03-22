//
//  HeaderView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/2/21.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var showHeadline = false
    var header: Header
    
    var slideInAnimation: Animation {
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
            .speed(1)
            .delay(0.25)
    }
    var body: some View {
        ZStack{
            Image(header.image)
                .resizable()
                .scaledToFill()
            
            
            HStack(alignment: .top, spacing: 16) {
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                    
                VStack(alignment: .leading, spacing: 6) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadline ? 75 : 220)
            .animation(slideInAnimation, value: showHeadline)
            .onAppear {
                showHeadline.toggle()
            }
            .onDisappear {
                showHeadline.toggle()
            }
        }
        .frame(width: 480, height: 320, alignment: .center)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headersData[1])
            .previewLayout(.sizeThatFits)
    }
}
