//
//  TextFieldAnimationView.swift
//  swiftui-common
//
//  Created by Than Van Thanh on 20/9/24.
//

import SwiftUI

struct TextFieldAnimationView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var body: some View {
        VStack(spacing: 50){
            InfoField(title: "First Name", text: $firstName)
            InfoField(title: "Last Name", text: $lastName)
        }
        .padding()
    }
        
}

#Preview {
    TextFieldAnimationView()
}

struct InfoField: View {
    let title: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    @Environment(\.colorScheme) var colorScheme
    
    private var backgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextField("", text: $text)
                .padding(.leading)
                .frame(height: 55).focused($isTyping)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(backgroundColor)
                        .stroke(isTyping ? .blue : Color.primary, lineWidth: 2)
                )
            
            Text(title).padding(.horizontal, 5)
                .background(backgroundColor)
                .foregroundStyle(isTyping ? .blue : Color.primary)
                .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
                .animation(.linear(duration: 0.2), value: isTyping)
        }
    }
}
