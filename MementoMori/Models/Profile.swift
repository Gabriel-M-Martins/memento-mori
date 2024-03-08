//
//  Profile.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import Foundation
import SwiftData

@Model
final class Profile {
    var name: String
    var birthDate: Date
    
    init(name: String, birthDate: Date) {
        self.name = name
        self.birthDate = birthDate
    }
}
