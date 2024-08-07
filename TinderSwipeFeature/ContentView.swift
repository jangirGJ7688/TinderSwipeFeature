//
//  ContentView.swift
//  TinderSwipeFeature
//
//  Created by Ganpat Jangir on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(1..<6){ i in
                    CardView(proxy: geometry, imageName: "image\(i)", index: i-1)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

