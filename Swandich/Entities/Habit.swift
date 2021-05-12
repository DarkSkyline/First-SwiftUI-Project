//
//  Habit.swift
//  Swandich
//
//  Created by Filipe Ferreira on 11/11/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import Foundation

class Habit: Identifiable, ObservableObject {
    let id = UUID().uuidString
    @Published var imageURL: URL?
    @Published var name: String
    var totalTime: Int {
        var sum = 0
        for slot in timeSlot {
            sum += slot.minutes
        }
        return sum
    }
    @Published var isFavorite: Bool
    @Published var description: String
    @Published var timeSlot: [SpentTime]
    
    init(imageURL: URL?, name: String, isFavorite: Bool, description: String) {
        self.imageURL = imageURL
        self.name = name
        self.isFavorite = isFavorite
        self.description = description
        self.timeSlot = []
    }
    
    init(config: NewHabitConfig) {
        self.imageURL = config.imageURL
        self.name = config.name
        self.description = config.description
        self.isFavorite = false
        self.timeSlot = []
    }
}
