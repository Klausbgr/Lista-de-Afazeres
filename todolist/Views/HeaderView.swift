//
//  HeaderView.swift
//  todolist
//
//  Created by  Klaus Boger on 14/04/25.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtittle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0,)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtittle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))

                }
            .padding(.top, 80)
            }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)    }
}

#Preview {
    HeaderView(title: "Title", subtittle: "Subtitle", angle: 15, background: .blue)
}
