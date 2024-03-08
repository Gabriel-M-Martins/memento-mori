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
    
    @State private var scrollPosition: Int? = 0
    
    @Namespace var bottomID
    
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
            
            ScrollViewReader { scrollReader in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: rectSize / 4) {
                        ForEach(days) { day in
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4.5]))
                                .fill(day.mood.color)
                                .foregroundStyle(day.mood == .Unknown ? .black : .clear)
                                .frame(width: rectSize, height: rectSize)
                                .shadow(color: .black.opacity(0.25), radius: 4)
                                .overlay {
                                    Text("\(day.mood.icon)")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .foregroundStyle(day.mood == .Unknown ? .black : .white)
                                }
                        }
                    }
                    .padding(.vertical)
                    
                    VStack {
                        Divider()
                            .scaleEffect(x: days.count > 0 ? 1 : 0)
                            .animation(.easeInOut, value: days.count)
                        
                        
                        VStack(spacing: 20) {
                            Image("icon")
                                .resizable()
                                .scaledToFit()
                            
                            Text("Memento Mori")
                                .font(.custom("CinzelDecorative-Regular", size: 32, relativeTo: .title))
                            
                            HStack {
                                Text("\(Image(systemName: "laurel.leading"))")
                                
                                Text("You have lived 7757 days!")
                                
                                Text("\(Image(systemName: "laurel.trailing"))")
                            }
                            .font(.title2)
                            
                            Text("""
                                    "Lorem ipsum dolor sit amet consectetur. Elementum at et facilisi scelerisque arcu habitant sed massa turpis."
                                    """)
                            .font(.title3)
                            .fontWeight(.light)
                            
                            HStack {
                                Spacer()
                                
                                Text("- Fulano de Tal")
                                    .fontWeight(.light)
                            }
                        }
                        .id(bottomID)
                        .frame(height: reader.size.height * 0.5)
                        .animation(.bouncy, value: days.count)
                        .onChange(of: days.count) {
                            scrollReader.scrollTo(bottomID)
                        }
                    }
                }
            }
            .scrollPosition(id: $scrollPosition)
            .scrollIndicators(.hidden)
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    let author: Author = Author(name: "Marcus Aurelius")
                    let quote: Quote = Quote(text: "Lorem ipsum dolor foo de bar", author: author)
                    
                    let day: Day = Day(quote: quote, diary: "", date: .now)
                    
                    day.mood = [Mood.Joyous, Mood.Good, Mood.Normal, Mood.Sad, Mood.Bad, Mood.Unknown].randomElement()!
                    
                    withAnimation {
                        modelContext.insert(day)
                    }
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
