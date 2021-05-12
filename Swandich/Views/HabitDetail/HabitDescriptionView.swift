//
//  HabitDescriptionView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct HabitDescriptionView: View {
    
    let description: String?
    let minutes: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                if let description = description {
                    Text(description)
                }
                Text("Total Time: \(minutes) min")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct HabitDescriptionView_Previews: PreviewProvider {
    
    static let description = ""
    static let minutes = 55
    
    static var previews: some View {
        HabitDescriptionView(description: description, minutes: minutes)
    }
}
