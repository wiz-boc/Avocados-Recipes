//
//  RipeningStagesView.swift
//  Avocados-Recipes
//
//  Created by wizz on 12/1/21.
//

import SwiftUI

struct RipeningStagesView: View {
    var ripeningStages = ripeningData
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            VStack{
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages){
                        RipeningView(ripening: $0)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}
