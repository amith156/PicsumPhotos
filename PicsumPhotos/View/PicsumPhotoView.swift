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
        
        ZStack {
            SearchNavigation(text: $searchText) {
                
            } cancel: {
                
            } content: {
                
                List {
                    
                    ForEach(picsumPhotoViewModel.dataObj.filter {
                        self.searchText.isEmpty ? true : $0.author.lowercased().prefix(searchText.count).contains(searchText.lowercased())
                    }, id: \.id) { model in
                        
                            
                        DownloadPicsumImageRow(model: model).environmentObject(picsumPhotoViewModel)

                    }
                    
                }
                .navigationTitle("Picsum Images")
                
            }
            
            
            
            
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PicsumPhotoView()
    }
}



//struct BottomCardView: View {
//    var body: some View {
//        VStack(spacing: 20){
//            Rectangle()
//                .frame(width: 40, height: 6, alignment: .center)
//                .cornerRadius(20)
//                .opacity(0.15)
//            Text("This certificate is a proof that Meng to has achived the UI Design course with approval from a DesigneCode instructor.")
//                .multilineTextAlignment(.center)
//                .lineSpacing(4)
//                .font(.subheadline)
//            Spacer()
//        }
//        .padding(.top, 8)
//        .padding(.horizontal, 20)
//        .frame(maxWidth: .infinity)
//        .background(Color.white)
//        .cornerRadius(30)
//        .shadow(radius: 20)
//    }
//}
