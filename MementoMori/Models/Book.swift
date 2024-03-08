//
//  Book.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import Foundation
import SwiftData

final class Book {
    var author: Author
    var desc: String
    var title: String
    
    // TODO: More info
    
    init(author: Author, desc: String = "", title: String = "") {
        self.author = author
        self.desc = desc
        self.title = title
    }
}
