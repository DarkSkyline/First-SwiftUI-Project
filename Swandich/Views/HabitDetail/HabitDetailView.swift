//
//  HabitDetailView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct HabitDetailView: View {
    
    @ObservedObject var habit: Habit
    
    @State private var selectedDate = Date()
    @State private var selectedTime = 30
    @State private var isAddingTime = false
    
    var body: some View {
        ScrollView {
            VStack {
                HabitHeaderView(habit: habit)
                HabitDescriptionView(description: habit.description, minutes: habit.totalTime)
                    .padding()
                if isAddingTime {
                    TimeConfigurationView(selectedMinutes: $selectedTime, selectedDate: $selectedDate)
                        .padding()
                }
                StandardButtonView(
                    color: isAddingTime ? .green : .blue,
                    action: {
                        withAnimation {
                            isAddingTime ? addNewTime() : toggleEditionMode()
                        }
                    },
                    title: isAddingTime ? "Save" : "Add new time")
                    .padding()
                
                ForEach(habit.timeSlot) { slot in
                    TimeCellView(spentTime: slot)
                        .padding()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                }
            }
        }
    }
    
    private func addNewTime() {
        let newTime = SpentTime(date: selectedDate, minutes: selectedTime)
        habit.timeSlot.append(newTime)
        toggleEditionMode()
    }
    
    private func toggleEditionMode() {
        isAddingTime.toggle()
    }
    
}

struct HabitDetailView_Previews: PreviewProvider {
    
    static let habit = HabitLibrary().testHabits[1]
    
    static var previews: some View {
        HabitDetailView(habit: habit)
    }
}
