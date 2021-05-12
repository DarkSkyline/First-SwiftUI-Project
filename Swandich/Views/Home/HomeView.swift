//
//  HomeView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 10/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var habitLibrary: HabitLibrary
    @State private var isShowingHabitCreation = false
    @State private var isShowingFavouriteOnly = false
    
    var body: some View {
        NavigationView {
            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                ScrollView {
                    VStack {
                        ForEach(habitLibrary.testHabits) { habit in
                            if habit.isFavorite || !isShowingFavouriteOnly {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.white)
                                        .shadow(color: Color(Color.RGBColorSpace.sRGB, white: 0, opacity: 0.2), radius: 4)
                                    
                                    NavigationLink(
                                        destination: HabitDetailView(habit: habit),
                                        label: {
                                            HabitCellView(habit: habit)
                                        })
                                }
                            }
                        }
                    }.padding(.horizontal, 10)
                    .animation(.default)
                }
                .navigationTitle(Text("My habits"))
                .navigationBarItems(trailing: Toggle(isOn: $isShowingFavouriteOnly, label: {
                    Text("❤️ only")
                }))
                ButtonAddView(action: {
                    self.isShowingHabitCreation.toggle()
                }).sheet(isPresented: $isShowingHabitCreation, content: {
                    HabitCreationView(habitLibrary: habitLibrary)
                })
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @StateObject static var habitLibrary = HabitLibrary()
    
    static var previews: some View {
        Group {
            HomeView(habitLibrary: habitLibrary)
            HomeView(habitLibrary: habitLibrary)
        }
    }
}
