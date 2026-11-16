//
//  JournalEditorView.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 06/06/1448 AH.
//

import SwiftUI

struct JournalEditorView: View {
    @ObservedObject var viewModel: JournalViewModel
    var entry: JournalEntry? = nil
    @State private var title = ""
    @State private var content = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Title", text: $title)
                    .font(.system(size: 34, weight: .bold))
                Text((entry?.date ?? Date()).formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 14))
                    .foregroundStyle(Color("TextSecondary"))
                ZStack(alignment: .topLeading) {
                    if content.isEmpty {
                        Text("Type your Journal...")
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }
                    TextEditor(text: $content)
                        .scrollContentBackground(.hidden)
                }
                .font(.system(size: 20))
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        dismiss()
                    } label : {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if let entry {
                            viewModel.updateEntry(entry: entry, title: title, content: content)
                        } else {
                            viewModel.addEntry(title: title, content: content)
                        }
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                        
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color("PrimaryAccent"))
                }
               
                    }
            .onAppear {
                if let entry {
                    title = entry.title
                    content = entry.content
                }
            }
                }
            }
            }
        
    
    
    


#Preview {
    JournalEditorView(viewModel: JournalViewModel())

    //JournalEditorView()
}
