//
//  FancyButton.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct FancyButton: View {
    
    @State private var isProcessing = false
    @State private var isComplete = false
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .frame(width: isProcessing ? 240 : 160, height: 80)
                .foregroundStyle(isComplete ? .green : .blue)
                .animation(.bouncy(duration: 0.5), value: isProcessing)
            
            if !isProcessing {
                Text("Submit")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            
            if isProcessing && !isComplete {
                HStack(spacing: 12) {
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 24, height: 24)
                        .rotationEffect(.degrees(isLoading ? 360 : 0))
                        .animation(.easeInOut.repeatForever(autoreverses: false), value: isLoading)
                    
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .foregroundStyle(.white)
                }
                .transition(.opacity)
                .onAppear {
                    startProcessing()
                }
            }
            
            if isComplete {
                Text("Completed")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .onAppear{
                        withAnimation(.default) {
                            endProcessing()
                        }
                    }
            }
        }
        .animation(.spring, value: isLoading)
        .onTapGesture {
            if !isLoading {
                isProcessing.toggle()
            }
        }
    }
}

#Preview {
    FancyButton()
}

extension FancyButton {
    func startProcessing() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            isComplete = true
        })
    }
    
    func endProcessing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            isProcessing = false
            isComplete = false
            isLoading = false
        })
    }
}
