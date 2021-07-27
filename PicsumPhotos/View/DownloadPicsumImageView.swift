//
//  DownloadPicsumImageView.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import SwiftUI

struct DownloadPicsumImageView: View {
    
    @StateObject var DPIvm : DownloadPicsumImageViewModel
    
    
    init(url: String, key: String) {
        _DPIvm = StateObject(wrappedValue: DownloadPicsumImageViewModel(url: url, key: key))
    }
    
    
    var body: some View {
        ZStack {
            if DPIvm.isLoading {
                ProgressView()
            }
            else if let image = DPIvm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.size.height/4)
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .shadow(radius: 40)
            }
        }

    }
}

struct DownloadPicsumImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadPicsumImageView(url: "https://unsplash.com/photos/yC-Yzbqy7PY", key: "0")
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.size.height/4)
            .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
            .previewLayout(.sizeThatFits)
    }
}
