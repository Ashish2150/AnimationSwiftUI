//
//  CustomListView.swift
//  SwiftDataDemo
//
//  Created by Ashish Maurya on 10/10/24.
//

import SwiftUI

struct CustomListView: View {
    
    @State var rowLabel: String
    @State var rowImage: String
    @State var rowContent: String
    @State var rowTint: Color
    
   
    
    var body: some View {
        LabeledContent {
            Text(rowContent)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
            //Link("", destination: URL(string: "https://www.google.com")!)
            
        } label: {
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 30, height: 30)
                            .foregroundColor(rowTint)
                        
                        Image(systemName: rowImage)
                            .foregroundColor(.white)
                       
                    }
                    Text(rowLabel)
                        .fontWeight(.medium)
                }
        }
    }
}

#Preview {
    List {
        CustomListView(rowLabel: "Designer", rowImage: "paintpalette", rowContent: "John Deo", rowTint: .pink)
    }
}
