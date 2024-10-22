//
//  CardView.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 29/09/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    @State var randomNumber: Int = 1
    @State var imageNumber: Int = 1
    @State var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
     
    var body: some View {
            ZStack {
                CustomBackgroundView()
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Hiking")
                                .fontWeight(.black)
                                .font(.system(size: 52))
                                .foregroundStyle(
                                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                                )
                            Spacer()
                            Button {
                                print("Hiking button pressed here..")
                                isShowingSheet.toggle()
                            } label: {
                                CustomButtonView()
                            }
                            .sheet(isPresented: $isShowingSheet) {
                                SettingView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium, .large])
                            }
                        }
                        Text("Fun and enjoyable outdoor activity for friends and family")
                            .multilineTextAlignment(.leading)
                            .italic()
                    }
                    .padding(.horizontal, 30)
                    ZStack {
                        CustomCircleView()
                        Image("image-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                    }
                    Button {
                        randomImage()
                    } label: {
                        Text("Explore More")
                            .fontWeight(.heavy)
                            .font(.title2)
                            .foregroundStyle(
                                LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
                            )
                            .shadow(color: .black.opacity(0.25), radius: 0.25, x:1 , y: 2)
                    }
                    .buttonStyle(GradientButtonStyle())
                }
            }
            .frame(width: 320, height: 570)
        
        
    }
}

#Preview {
    CardView()
}
