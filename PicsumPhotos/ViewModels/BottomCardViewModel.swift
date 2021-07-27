//
//  BottomCardViewModel.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import Foundation
import SwiftUI

class BottomCardViewModel: ObservableObject {
    
    @Published var image : UIImage? = nil
    @State var key : String = ""
    
    init(key: String) {
        self.key = key
        image = manager.get(key: key)
    }
    
    let manager = PicsumPhotoCacheManager.instace
    
    
}
