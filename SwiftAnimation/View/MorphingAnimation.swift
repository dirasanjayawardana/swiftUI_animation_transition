//
//  MorphingAnimation.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct MorphingAnimation: View {
    
    @State private var recordBegin = false
    @State private var recordingScale = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 20 : 30)
                .frame(width: recordBegin ? 160 : 60, height: 60)
                .foregroundStyle(.blue)
                .overlay {
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                        .scaleEffect(recordingScale ? 1 : 0.7)
                }
            
            RoundedRectangle(cornerRadius: recordBegin ? 20 : 40)
                .trim(from: 0, to: recordBegin ? 0 : 1)
                .stroke(Color(.systemGray2),lineWidth: 5)
                .frame(width: recordBegin ? 180 : 80, height: 80)
        }
        .onTapGesture {
            withAnimation(.default) {
                recordBegin.toggle()
                recordingScale.toggle()
            }
        }
    }
}

#Preview {
    MorphingAnimation()
}
