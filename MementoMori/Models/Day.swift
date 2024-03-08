//
//  File.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Day {
    var date: Date
    var quote: Quote
    var diary: String?
    var mood: Mood
    
    init(quote: Quote, diary: String? = nil, mood: Mood = .Unknown, date: Date = .now) {
        self.quote = quote
        self.diary = diary
        self.mood = mood
        self.date = date
    }
}

enum Mood: Codable {
    case Joyous, Good, Normal, Sad, Bad, Unknown
    
    var icon: Image {
        switch self {
        case .Joyous:
            return Image(systemName: "arrow.up")
        case .Good:
            return Image(systemName: "arrow.up.forward")
        case .Normal:
            return Image(systemName: "arrow.forward")
        case .Sad:
            return Image(systemName: "arrow.down.forward")
        case .Bad:
            return Image(systemName: "arrow.down")
        case .Unknown:
            return Image(systemName: "questionmark")
        }
    }
    
    var color: Color {
        switch self {
        case .Joyous:
            return .joyous
        case .Good:
            return .good
        case .Normal:
            return .normal
        case .Sad:
            return .sad
        case .Bad:
            return .bad
        case .Unknown:
            return .clear
        }
    }
}
