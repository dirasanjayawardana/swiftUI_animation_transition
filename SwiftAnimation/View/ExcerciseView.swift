//
//  ExcerciseView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ExcerciseView: View {
    
    @State private var isShow = true
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 80))
            
            if isShow {
                HStack {
                    Text("5.0")
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                .padding(.top, 4)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .transition(.offset(x: 0, y: -60).combined(with: .opacity))
            }
            
            HStack {
                ForEach(0...4, id: \.self) { item in
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(isLoading ? .gray.opacity(0.5) : .green)
                        .scaleEffect(isLoading ? 0.4 : 1)
                        .animation(.linear(duration: 0.6).repeatForever().delay(0.2*Double(item)), value: isLoading)
                }
            }
        }
        .animation(.default, value: isShow)
        .onTapGesture {
            handleClick()
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}

#Preview {
    ExcerciseView()
}

extension ExcerciseView {
    // delay saat handleClick
    func handleClick() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            isShow.toggle()
        })
    }
}
