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
    let manager = PicsumPhotoCacheManager.instace
    let imageKey: String
    
    init(url : String, key: String) {
        self.imageUrlString = url
        self.imageKey = key
        downloadImage()
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting image from cache memory!!!!")
        }
        else {
            downloadImage()
            print("Downloading image!!!!!")
        }
    }
    
    
    func downloadImage() {
        
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
                guard let self = self,
                      let image = returnedImage else { return }
                
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &canellables)

        
        
    }
    
    
}
