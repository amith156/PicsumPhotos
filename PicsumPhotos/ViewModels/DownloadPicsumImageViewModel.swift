//
//  DownloadPicsumImageViewModel.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import Foundation
import SwiftUI
import Combine

class DownloadPicsumImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading : Bool = true
    
    let imageUrlString : String
    var canellables = Set<AnyCancellable>()
    
    
    init(url : String) {
        self.imageUrlString = url
        downloadImage()
    }
    
    
    
    
    func downloadImage() {
        print("Downloading image!!!!!")
        guard let url = URL(string: imageUrlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in
                return UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
//                self?.isLoading = false
                
                switch completion {
                case .finished:
                    self?.isLoading = false
                    break
                case .failure(let error):
                    print(error)
                }
                
                
                
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &canellables)

        
        
    }
    
    
}
