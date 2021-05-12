//
//  HabitCreationView.swift
//  Swandich
//
//  Created by Filipe Ferreira on 16/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import SwiftUI

struct HabitCreationView: View {
    
    @ObservedObject var habitLibrary: HabitLibrary
    @State var habitConfig = NewHabitConfig()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    TextField("Habit name", text: $habitConfig.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextEditor(text: $habitConfig.description)
                        .border(Color.gray, width: 1)
                        .frame(height: 150)
                }.padding()
                HabitGridView(selectedUrl: $habitConfig.imageURL)
            }.navigationTitle("New Habit")
            .navigationBarItems(trailing: Button(action: {
                let newHabit = Habit(config: habitConfig)
                habitLibrary.testHabits.append(newHabit)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct HabitCreationView_Previews: PreviewProvider {
    
    @StateObject static var habitLibrary = HabitLibrary()
    
    static var previews: some View {
        HabitCreationView(habitLibrary: habitLibrary)
    }
}
