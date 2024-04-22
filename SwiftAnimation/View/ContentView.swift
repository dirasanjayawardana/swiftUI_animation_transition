//
//  ContentView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorChange = false;
    @State private var sizeChange = false;
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(colorChange ? .blue : .cyan)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.pink)
                .font(.system(size: 100))
                .scaleEffect(sizeChange ? 1.0 : 0.7)
        }
        .animation(.default, value: colorChange)
        .animation(.default, value: sizeChange)
        .onTapGesture {
            colorChange.toggle()
            sizeChange.toggle()
        }
    }
}

#Preview {
    ContentView()
}
