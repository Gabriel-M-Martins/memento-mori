//
//  Author.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import Foundation
import SwiftData

@Model
final class Author {
    var name: String
    var about: String
    var quotes: [Quote]
    var books: [Book]
    var isFavorited: Bool = false
    
    init(name: String, about: String = "", quotes: [Quote] = [], books: [Book] = []) {
        self.name = name
        self.about = about
        self.quotes = quotes
        self.books = books
    }
}
