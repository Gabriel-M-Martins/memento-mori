//
//  CalendarView.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    @Environment(\.modelContext) var modelContext
    @Query var days: [Day]
    
    private let columns: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        GeometryReader { reader in
            let rectSize = reader.size.width * 0.1
//            VStack(spacing: 20) {
//                Spacer()
//                
//                Image("icon")
//
//                Text("Memento Mori")
//                    .font(.custom("CinzelDecorative-Regular", size: 32, relativeTo: .title))
//                
//                HStack {
//                    Text("\(Image(systemName: "laurel.leading"))")
//                    
//                    Text("You have lived 7757 days!")
//                    
//                    Text("\(Image(systemName: "laurel.trailing"))")
//                }
//                .font(.title2)
//                
//                Text("""
//                    "Lorem ipsum dolor sit amet consectetur. Elementum at et facilisi scelerisque arcu habitant sed massa turpis."
//                    """)
//                .font(.title3)
//                .fontWeight(.light)
//                
//                HStack {
//                    Spacer()
//                    
//                    Text("- Fulano de Tal")
//                        .fontWeight(.light)
//                }
//            }
//            .padding()
            
//            LazyVGrid(columns: columns, spacing: rectSize / 2) {
//                ForEach(days) { day in
//                    
//                    Text("\(day.mood.icon)")
//                        .font(.title2)
//                        .fontWeight(.light)
//                        .foregroundStyle(.white)
//                        .background {
//                            RoundedRectangle(cornerRadius: 8)
//                                .fill(day.mood.color)
//                                .frame(width: rectSize, height: rectSize)
//                                .shadow(color: .black.opacity(0.25), radius: 4)
//                        }
//                }
//            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    let author: Author = Author(name: "Marcus Aurelius")
                    let quote: Quote = Quote(text: "Lorem ipsum dolor foo de bar", author: author)
                    
                    let day: Day = Day(quote: quote, diary: "", date: .now)
                    
                    day.mood = [Mood.Joyous, Mood.Good, Mood.Normal, Mood.Sad, Mood.Bad].randomElement()!
                    
                    modelContext.insert(day)
                } label: {
                    Label(
                        title: { Text("Add") },
                        icon: { Image(systemName: "plus") }
                    )
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CalendarView()
            .modelContainer(for: Day.self, inMemory: true)
    }
}
