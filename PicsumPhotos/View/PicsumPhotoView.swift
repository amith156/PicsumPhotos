//
//  ContentView.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 26/07/2021.
//

import SwiftUI

struct PicsumPhotoView: View {
    
    
    @StateObject var picsumPhotoViewModel = PicsumPhotoViewModel()
    @State var searchText = ""
    
    var body: some View {
        
        SearchNavigation(text: $searchText) {
            
        } cancel: {
            
        } content: {
            
            List {
                
                ForEach(picsumPhotoViewModel.dataObj.filter {
                    self.searchText.isEmpty ? true : $0.author.lowercased().prefix(searchText.count).contains(searchText.lowercased())
                }, id: \.id) { model in
                    

                    DownloadPicsumImageRow(model: model)
                    
                    
                }
                
            }
            .navigationTitle("Picsum Images")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PicsumPhotoView()
    }
}
