//
//  JournalCardView.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 05/06/1448 AH.
//

import SwiftUI

struct JournalCardView: View {
    let entry: JournalEntry
    @ObservedObject var viewModel: JournalViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(entry.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color("TextAccent"))
                Spacer()
                Button {
                    viewModel.toggleBookmark(entry: entry)
                } label: {
                    
                    Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundStyle(Color("TextAccent"))
                }
                .buttonStyle(.plain)
            }
            Text(entry.date.formatted(date: .numeric, time: .omitted))
                .font(.system(size: 14))
                .foregroundStyle(Color("TextSecondary"))
            Text(entry.content)
                .font(.system(size: 18))
                .foregroundStyle(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("Card"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    JournalCardView(
        entry: JournalEntry(title: "My Birthday", date: Date(), content: "Lorem ipsum dolor sit amet.", isBookmarked: true),
        viewModel: JournalViewModel()
    )
    .padding()
    //.background(.black)
}
