//
//  HomeViewModel.swift
//  TinderSwipeFeature
//
//  Created by Ganpat Jangir on 07/08/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var images: [String] = [1,2,3,4,5].map { return "image\($0)"}
    
    init() {
        
    }
    
    func deleteOnSwipe() {
        guard !images.isEmpty else {
            return
        }
        self.images.removeLast()
    }
    
}
