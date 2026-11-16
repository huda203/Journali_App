import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showAddSheet = false
    @State private var selectedEntry: JournalEntry? = nil
    @State private var entryToDelete: JournalEntry? = nil
    @State private var showDeleteAlert = false
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.entries.isEmpty {
                    VStack(spacing: 16){
                        Image("EmptyState")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 151.39, height: 97.32)
                        Text("Begin Your Journal")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color("TextAccent"))
                        Text("Craft your personal diary, tap the plus icon to begin")
                            .font(.system(size: 18, weight: .light))
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.center)
                        
                            
                    }
                } else {
                    List(viewModel.displayedEntries) { entry in
                        JournalCardView(entry: entry ,viewModel: viewModel)
                            .onTapGesture {
                                selectedEntry = entry
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive) {
                                    entryToDelete = entry
                                    showDeleteAlert = true
                                } label: {
                                    Image(systemName: "trash.fill")
                                    
                                }
                            }
                        
                        
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    }
                
            }

            .navigationTitle("Journal")
            
            .searchable(text: $viewModel.searchText)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                        
                    }
                    
                }
            .sheet(isPresented: $showAddSheet) {
                JournalEditorView(viewModel: viewModel)
            }
                    .sheet(item: $selectedEntry) { entry in
                        JournalEditorView(viewModel: viewModel, entry: entry)
                    }
                    .alert("Delete Journal", isPresented: $showDeleteAlert) {
                        Button("Cancel", role: .cancel) { }
                        Button("Delete", role: .destructive) {
                            if let entryToDelete {
                                viewModel.deleteEntry(entry: entryToDelete)
                            }
                        }
                    } message: {
                        Text("Are you sure you want to delete this journal?")
                    }
                        
                        
                    
                
            }
            }
        }
            


#Preview {
    ContentView()
}

