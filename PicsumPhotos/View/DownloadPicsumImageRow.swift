//
//  DownloadPicsumImageRow.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import SwiftUI

struct DownloadPicsumImageRow: View {
    
    let model: PicsumElement
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                DownloadPicsumImageView(url: model.downloadURL, key: model.id)
                    .frame(maxWidth: UIScreen.main.bounds.size.width / 1.1)
                    .frame(height: UIScreen.main.bounds.size.height/4)
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .shadow(radius: 12)
            }.padding()
                
            
            Text(model.author)
                .font(.title)
                .foregroundColor(.primary)
                .padding(.bottom)
                
        }
    }
}

struct DownloadPicsumImageRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadPicsumImageRow(model: PicsumElement(id: "0", author: "Alejandro Escamilla", width: 5616, height: 3744, url: "https://unsplash.com/photos/yC-Yzbqy7PY", downloadURL: "https://picsum.photos/id/0/5616/3744"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
