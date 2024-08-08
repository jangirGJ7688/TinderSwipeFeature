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

