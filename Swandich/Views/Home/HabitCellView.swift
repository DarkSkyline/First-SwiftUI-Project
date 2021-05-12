//
//  HabitCellView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 11/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HabitCellView: View {
    
    @State var habit: Habit
    
    var body: some View {
        HStack {
            KFImage(habit.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height:80)
                .clipped()
                .cornerRadius(10)
                .padding(.trailing, 8)
            
            HStack {
                DescriptionLanguageView(name: habit.name, totalTime: habit.totalTime)
                Spacer()
                LikeButtonView(onColor: .red, offColor: .gray, isLiked: $habit.isFavorite)
            }
            Spacer()
        }
    }
}

struct HabitCellView_Previews: PreviewProvider {
    
    private static let testHabit = Habit(imageURL: URL(string: "https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), name: "Coding", isFavorite: false, description: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ")
    
    static var previews: some View {
        HabitCellView(habit: testHabit)
            .previewLayout(.sizeThatFits)
    }
}
