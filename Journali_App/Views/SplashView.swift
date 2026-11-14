//
//  Journali Splash.View.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 29/05/1448 AH.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient (
            colors: [.black ,Color("SplashMid"), Color("SplashBottom")],
            startPoint: .top,
            endPoint: .bottom
            )
                .ignoresSafeArea()
            
            VStack {
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width:81.46, height:106)
                Text("Journali")
                    .font(.system(size: 42,  weight: .black))
                    .foregroundStyle(.white)
                
                Text("Your thoughts, your story")
                    .font(.system(size: 18, weight: .light ))
                    .foregroundStyle(.white)
            }
        }
    }
}
#Preview {
    SplashView()
}
