//
//  LoadingIndicator.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        VStack(spacing: 40) {
            CircleLoading()
            
            ProgressLoading()
        }
    }
}

#Preview {
    LoadingIndicator()
}

struct CircleLoading: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 16)
                .frame(width: 80, height: 80)
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(Color.blue, lineWidth: 16)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                //.animation(.easeInOut.repeatForever(autoreverses: false), value: isLoading)
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: isLoading)
                .onAppear{
                    isLoading = true
                }
        }
    }
}

struct ProgressLoading: View {
    
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Text("\(progress * 100, specifier: "%.f")%")
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 16)
                .frame(width: 80, height: 80)
            
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(Color.blue, lineWidth: 16)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            //.animation(.easeInOut.repeatForever(autoreverses: false), value: isLoading)
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: isLoading)
                .onAppear{
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
                        
                        if progress > 1.0 {
                            // timer.invalidate()
                            progress = 0.0
                        } else {
                            progress += 0.05
                        }
                    })
                }
        }
        .frame(width: 100, height: 100)
    }
}
