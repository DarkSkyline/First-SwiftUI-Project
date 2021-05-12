//
//  ButtonAddView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 13/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct ButtonAddView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action:
            self.action
        , label: {
            ZStack{
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
            }.shadow(radius: 10)
        })
        
    }
    
}

struct ButtonAddView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAddView(action: {})
            .previewLayout(.sizeThatFits).padding()
    }
}
