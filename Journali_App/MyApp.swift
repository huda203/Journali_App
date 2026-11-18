import SwiftUI

@main struct MyApp: App {
    @State private var showSplash = true
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    
                    SplashView()
                    
                } else {
                    
                    ContentView()
                }
            }
            .task {
                try? await Task.sleep(for: .seconds(2))
                withAnimation {
                    showSplash = false
                }
            }
            //.onAppear {
              //  DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                //    withAnimation {
                  //      showSplash = false
            
                   // }
              //  }
           // }
                .preferredColorScheme(.dark)
        }
    }
}
