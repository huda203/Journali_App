import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var showAddSheet = false
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
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    }
                
            }

            .navigationTitle("Journal")
            
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
            }
        }
            
    }


#Preview {
    ContentView()
}

