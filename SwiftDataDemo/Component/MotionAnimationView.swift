//
//  MotionAnimationView.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 08/10/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 6...12)
    
    @State private var isAnimating = false
    
    //Random Cordinate
    
    func randomCordinator () -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize () -> CGFloat {
        return CGFloat.random(in: 0...100)
    }

    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    //Random Speed
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x : randomCordinator(),
                        y : randomCordinator()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
            }
        }
        .drawingGroup()
        .mask(Circle())
        .frame(width: 256, height: 256)
    }
}

struct MotionAnimationView_Preview: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(
                Circle().fill(.teal)
            )
    }
}
