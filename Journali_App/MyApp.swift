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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation {
                        showSplash = false
                    }
                }
            }
                .preferredColorScheme(.dark)
        }
    }
}
