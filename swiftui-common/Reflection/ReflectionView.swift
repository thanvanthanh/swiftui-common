//
//  ReflectionView.swift
//  swiftui-common
//
//  Created by Than Van Thanh on 20/9/24.
//

import SwiftUI

struct ReflectionView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                
                Spacer()
                
                Text("Hello, SwiftUI!")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple, .red],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .reflection(spacing: 0)
                
                Image("duck")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .clipped()
                    .reflection(spacing: -10)
            }
        }
    }
}

#Preview {
    ReflectionView()
}

struct ReflectionModifier: ViewModifier {
    var opacity: Double
    var spacing: CGFloat
    func body(content: Content) -> some View {
        VStack(spacing: spacing) {
            content
            content
                .scaleEffect(y: -1)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [.black, .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .opacity(opacity)
        }
    }
}

extension View {
    func reflection(opacity: Double = 0.4, spacing: CGFloat = 0) -> some View {
        self.modifier(ReflectionModifier(opacity: opacity, spacing: spacing))
    }
}
