//
//  Quote.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import Foundation
import SwiftData

@Model
final class Quote {
    var text: String
    var author: Author
    var isFavorited: Bool = false
    
    init(text: String, author: Author) {
        self.text = text
        self.author = author
    }
}
