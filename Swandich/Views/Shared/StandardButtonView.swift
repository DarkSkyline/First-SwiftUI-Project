//
//  StandardButtonView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct StandardButtonView: View {
    
    let color: Color
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    
                Spacer()
            }
        }).background(color)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct StandardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StandardButtonView(color: .blue, action: {}, title: "Test Button")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
