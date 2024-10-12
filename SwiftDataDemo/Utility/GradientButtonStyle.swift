//
//  ButtonStyleExtension.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 02/10/24.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(gradient: Gradient(colors: [.colorGrayLight, .colorGrayMedium]), startPoint: .top, endPoint: .bottom) :
                    LinearGradient(gradient: Gradient(colors: [.colorGrayMedium, .colorGrayLight]), startPoint: .top, endPoint: .bottom)
            
            )
            .cornerRadius(40)
    }
}
