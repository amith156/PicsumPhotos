//
//  BottomCardView.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import SwiftUI

struct BottomCardView: View {
    
    let model : PicsumElement
    @StateObject var bottomCardViewModel : BottomCardViewModel
    
    init(model : PicsumElement) {
        self.model = model
        _bottomCardViewModel = StateObject(wrappedValue: BottomCardViewModel(key: model.id))
    }
    
    
    var body: some View {
        
        VStack {
            
            Text(model.author)
            
            if let image = bottomCardViewModel.image {
                Image(uiImage: image)
                
            }
            
        }
        
        
    
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(model:  PicsumElement(id: "0", author: "Alejandro Escamilla", width: 5616, height: 3744, url: "https://unsplash.com/photos/yC-Yzbqy7PY", downloadURL: "https://picsum.photos/id/0/5616/3744"))
    }
}
