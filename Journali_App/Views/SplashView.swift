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
                colors: [Color(.systemBackground), Color("SplashMid"), Color("SplashBottom")],
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
                    .foregroundStyle(.primary)
                
                Text("Your thoughts, your story")
                    .font(.system(size: 18, weight: .light ))
                    .foregroundStyle(.primary)
            }
        }
    }
}
#Preview {
    SplashView()
}
