//
//  Journali Splash.View.swift
//  Journali_App
//
//  Created by Huda Abdelkader on 29/05/1448 AH.
//

import SwiftUI

struct Journali_Splash_View: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height:100)
                Text("Journali")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                Text("Your thoughts, your story")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}
#Preview {
    Journali_Splash_View()
}
