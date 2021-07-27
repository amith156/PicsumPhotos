//
//  ContentView.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 26/07/2021.
//

import SwiftUI

struct PicsumPhotoView: View {
    
    
    @StateObject var picsumPhotoViewModel = PicsumPhotoViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(picsumPhotoViewModel.dataObj, id: \.id) { model in
                    
                    Text(model.author)
                                .padding()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PicsumPhotoView()
    }
}
