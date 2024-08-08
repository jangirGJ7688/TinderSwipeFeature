//
//  ContentView.swift
//  TinderSwipeFeature
//
//  Created by Ganpat Jangir on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack{
                    Text("LikeIT")
                        .padding(.leading,40)
                    Image(systemName: "heart.square.fill")
                    Spacer()
                }
                .font(.largeTitle.bold())
                .foregroundStyle(Color.red)
                ZStack {
                    ForEach(vm.images,id: \.self) { image in
                        CardView(proxy: geometry, imageName: image, vm: vm)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

