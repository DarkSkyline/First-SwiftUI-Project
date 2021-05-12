//
//  SpentTime.swift
//  Swandich
//
//  Created by Filipe Ferreira on 02/12/2020.
//  Copyright © 2020 Filipe Ferreira. All rights reserved.
//

import Foundation

struct SpentTime: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let minutes: Int
}
