//
//  JournalViewModel.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 04/06/1448 AH.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    @Published var searchText: String = ""
    @Published var sortOption: SortOption = .date
    
    func addEntry(title: String, content: String) {
        let newEntry = JournalEntry(title:title, date:Date(), content:content, isBookmarked:false)
        entries.append(newEntry)
    }
        func deleteEntry(entry: JournalEntry) {
            entries.removeAll {$0.id == entry.id}
        }
    func toggleBookmark(entry: JournalEntry){
        if let index = entries.firstIndex(where:{$0.id == entry.id}) {
            entries[index].isBookmarked.toggle()
        }
    }
    func updateEntry(entry: JournalEntry, title: String, content: String) {
        if let index = entries.firstIndex(where:{$0.id == entry.id}) {
            entries[index].title = title
            entries[index].content = content
        }
        
    }
    var displayedEntries: [JournalEntry] {
        var result = entries
        
        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedStandardContains(searchText) ||
                $0.content.localizedStandardContains(searchText)
            }
        }
        if sortOption == .bookmark {
            result = result.filter { $0.isBookmarked}
        }
        return result.sorted { $0.date > $1.date}
    }
}
