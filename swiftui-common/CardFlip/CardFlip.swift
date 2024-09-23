//
//  CardFlip.swift
//  swiftui-common
//
//  Created by Than Van Thanh on 23/9/24.
//

import SwiftUI

struct CardFlip: View {
    @State var isFlipped = false
    
    var body: some View {
        ZStack {
            MyCard(text: "Back",
                   textColor: .yellow,
                   subText: "Discount 50%.",
                   color: .orange,
                   sColor: .yellow,
                   isTrue: 0,
                   isFalse: -90,
                   isFlipped: isFlipped)
                .animation(isFlipped ? .linear.delay(0.35) : .linear,
                           value: isFlipped)
            
            MyCard(text: "Flip Card",
                   textColor: .orange,
                   color: .yellow,
                   sColor: .orange,
                   isTrue: 90,
                   isFalse: 0,
                   isFlipped: isFlipped)
                .animation(isFlipped ? .linear : .linear.delay(0.35),
                           value: isFlipped)
            
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    CardFlip()
}

struct MyCard: View {
    var text: String
    var textColor: Color
    var subText: String = ""
    var subTextColor: Color = .white
    var color: Color
    var sColor: Color
    var isTrue: CGFloat
    var isFalse: CGFloat
    var isFlipped: Bool
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .foregroundColor(color)
                .overlay(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0, to: 0.20)
                        .frame(width: 220, height: 200)
                        .foregroundColor(sColor)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.red)
                }
            
            VStack {
                Text(text).bold().font(.title)
                    .foregroundColor(textColor)
                
                Text(subText).font(.subheadline)
                    .foregroundColor(subTextColor)
            }
            
        }
        
        .rotation3DEffect(
            .degrees(isFlipped ? isTrue : isFalse),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
