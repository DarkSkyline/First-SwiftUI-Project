//
//  TimeConfigurationView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct TimeConfigurationView: View {
    
    @Binding var selectedMinutes: Int
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Picker("Minute", selection: $selectedMinutes) {
                ForEach(0 ..< 60){
                    Text("\($0)")
                        .rotationEffect(Angle(degrees: 90))
                }
            }.rotationEffect(Angle(degrees: -90))
            .frame(maxHeight: 50)
            .clipped()
            
            DatePicker(
                "Select a Date",
                selection: $selectedDate,
                in: ...Date(),
                displayedComponents: .date
            )
            
        }
    }
}

struct TimeConfigurationView_Previews: PreviewProvider {
    
    @State private static var minutes = 30
    @State private static var date = Date()
    
    static var previews: some View {
        TimeConfigurationView(selectedMinutes: $minutes, selectedDate: $date)
    }
}
