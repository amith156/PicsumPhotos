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
            
            if let image = bottomCardViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .padding()
                
            }
            
            
            HStack {
                Text("Auther : ")
                    .font(.system(size: 30))

                Text(model.author)
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            
            
            
            
            HStack {
                Text("Width : ")
                    .font(.system(size: 30))
                
                Text("\(model.width)")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            
            HStack {
                Text("Height : ")
                    .font(.system(size: 30))
                
                Text("\(model.height)")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            
            VStack {
                HStack {
                    Text("Download URL : ")
                        .font(.system(size: 30))
                    Spacer()
                }
                
                HStack {
                    Text("\(model.downloadURL)")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            
            
            VStack {
                HStack {
                    Text("URL : ")
                        .font(.system(size: 30))
                    Spacer()
                }
                
                HStack {
                    Text("\(model.url)")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            
            
            
            
            Spacer()
            
            
            
            
            
            
        }
        
        
        
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView(model:  PicsumElement(id: "0", author: "Alejandro Escamilla", width: 5616, height: 3744, url: "https://unsplash.com/photos/yC-Yzbqy7PY", downloadURL: "https://picsum.photos/id/0/5616/3744"))
    }
}
