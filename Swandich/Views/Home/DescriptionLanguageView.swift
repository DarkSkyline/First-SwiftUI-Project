//
//  DescriptionLanguageView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 11/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct DescriptionLanguageView: View {
    
    let name: String
    let totalTime: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.name)
                .font(.system(size:22))
                .fontWeight(.semibold)
            Text("Total : \(self.totalTime) minutes")
        }
    }
}

struct DescriptionLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionLanguageView(name: "Test1", totalTime: 5)
    }
}
