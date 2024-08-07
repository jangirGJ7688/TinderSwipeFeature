//
//  CardView.swift
//  TinderSwipeFeature
//
//  Created by Ganpat Jangir on 07/08/24.
//

import SwiftUI

struct CardView: View {
    @GestureState var traslation: CGSize = .zero
    @GestureState var degrees: Double = 0
    let proxy: GeometryProxy
    let imageName: String
    let index: Int
    
    init(proxy: GeometryProxy, imageName: String,index: Int) {
        self.proxy = proxy
        self.imageName = imageName
        self.index = index
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .updating($traslation) { (value, state, _) in
                state = value.translation
            }
            .updating($degrees) { (value, state, _) in
                state = value.translation.width > 0 ? 2 : -2
            }
            .onEnded { value in
                
            }
        
        Rectangle()
            .overlay {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
            .cornerRadius(10)
            .frame(
                maxWidth: proxy.size.width - 20,
                maxHeight: proxy.size.height*0.8
            )
            .position(
                x: proxy.frame(in: .global).midX - CGFloat(index * 1),
                y: proxy.frame(in: .global).midY - 100 - CGFloat(index * 2)
            )
            .offset(x: traslation.width,y: 0)
            .rotationEffect(.degrees(degrees))
            .gesture(dragGesture)
            .animation(.interactiveSpring())
    }
}

#Preview {
    GeometryReader { proxy in
        CardView(proxy: proxy, imageName: "image1", index: 0)
    }
}
