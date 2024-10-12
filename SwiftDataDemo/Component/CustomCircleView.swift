//
//  CustomCircleView.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 02/10/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimationGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors:
                                    [.customIndigoMedium, .customSaimonLight],
                                   startPoint: isAnimationGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimationGradient ? .bottomTrailing : .topTrailing
                                  )
                )
                .onAppear(){
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimationGradient.toggle()
                    }
                }.frame(width: 256, height: 256)
            MotionAnimationView()
        }

    }
}

#Preview {
    CustomCircleView()
}
