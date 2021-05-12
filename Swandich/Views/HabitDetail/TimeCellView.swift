//
//  TimeCellView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct TimeCellView: View {
    
    let spentTime: SpentTime
    
    var body: some View {
        HStack {
            Text("\(spentTime.minutes) min")
                .fontWeight(.semibold)
            Spacer()
            Text(stringDate(date: spentTime.date))
        }
    }
    
    private func stringDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
}

struct TimeCellView_Previews: PreviewProvider {
    
    static let time = SpentTime(date: Date(), minutes: 30)
    
    static var previews: some View {
        TimeCellView(spentTime: time)
    }
}
