//
//  TransitionView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var show = false;
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 300, height: 300)
                .foregroundStyle(.blue)
                .overlay {
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            
            if show {
                RoundedRectangle(cornerRadius: 32)
                    .padding(.top, 18)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.blue)
                    //.transition(.scale(scale: 0, anchor: .bottom))
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                    .transition(.offsetScaleOpacity)
                    .overlay {
                        Text("Well, it goes like this!")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
            }
        }
        .onTapGesture {
            withAnimation(.default) {
                show.toggle()
            }
        }
    }
}

#Preview {
    TransitionView()
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        // AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
        
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}
