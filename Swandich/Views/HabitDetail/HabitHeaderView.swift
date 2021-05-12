//
//  HabitHeaderView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HabitHeaderView: View {
    
    @ObservedObject var habit: Habit
    
    var body: some View {
        ZStack (alignment: .bottom) {
            KFImage(habit.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            LinearGradient(gradient: Gradient(colors: [Color(white: 0, opacity: 0.5), .clear]), startPoint: .bottom, endPoint: .top)
                .frame(height: 100)
            
            HStack {
                Text(habit.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                LikeButtonView(onColor: .red, offColor: .white, isLiked: $habit.isFavorite)
                    .padding()
            }
            
        }
    }
}

struct HabitHeaderView_Previews: PreviewProvider {
    
    static let habit = HabitLibrary().testHabits[0]
    
    static var previews: some View {
        HabitHeaderView(habit: habit)
    }
}
