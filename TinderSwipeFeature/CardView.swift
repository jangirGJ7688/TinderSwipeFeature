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
    @ObservedObject var vm: HomeViewModel
    @State var dragDirection: DragDirection = .none
    
    enum DragDirection {
        case right
        case left
        case none
    }
    
    init(proxy: GeometryProxy, imageName: String, vm: HomeViewModel) {
        self.proxy = proxy
        self.imageName = imageName
        self.vm = vm
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .updating($traslation) { (value, state, _) in
                state = value.translation
            }
            .updating($degrees) { (value, state, _) in
                state = value.translation.width > 0 ? 10 : -10
            }
            .onChanged { value in
                if value.translation.width > 0 {
                    dragDirection = .right
                }else if value.translation.width < 0 {
                    dragDirection = .left
                }
            }
            .onEnded { value in
                if proxy.size.width*0.7 <= abs(value.translation.width) {
                    self.vm.deleteOnSwipe()
                }
            }
        Rectangle()
            .overlay {
                GeometryReader { geo in
                    ZStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                        Image(systemName: dragDirection == .right ? "heart.circle" : "xmark.circle")
                            .resizable()
                            .foregroundStyle(dragDirection == .right ? Color.green : Color.red)
                            .frame(width: 80,height: 80)
                            .opacity(abs(traslation.width) > 0 ? 1 : 0)
                    }
                    .position(
                        x: geo.frame(in: .local).midX,
                        y: geo.frame(in: .local).midY
                    )
                    
                }
            }
            .cornerRadius(10)
            .frame(
                maxWidth: proxy.size.width - 20,
                maxHeight: proxy.size.height*0.8
            )
            .position(
                x: proxy.frame(in: .global).midX ,
                y: proxy.frame(in: .global).midY - 100
            )
            .offset(x: traslation.width,y: 0)
            .rotationEffect(.degrees(degrees))
            .gesture(dragGesture)
            .animation(.interactiveSpring())
    }
}

#Preview {
    GeometryReader { proxy in
        CardView(proxy: proxy, imageName: "image1", vm: HomeViewModel())
    }
}
