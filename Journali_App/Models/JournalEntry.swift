//
//  JournalEntry.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 04/06/1448 AH.
//

import Foundation

struct JournalEntry: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var content: String
    var isBookmarked: Bool
    
}
