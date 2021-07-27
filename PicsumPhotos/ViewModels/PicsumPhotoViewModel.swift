//
//  PicsumPhotoViewModel.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 26/07/2021.
//

import Foundation
import Combine

class PicsumPhotoViewModel: ObservableObject {
    
    
    @Published var dataObj : Picsum = []
    var canellables = Set<AnyCancellable>()
    
    let picsumDownloadService = PicsumDownloadService.picsumDownloadServiceInstance
    
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        picsumDownloadService
            .$picsumModels
            .sink { [weak self] returnedPicsumArray in
                self?.dataObj = returnedPicsumArray
                
            }
            .store(in: &canellables)
        
        
    }
    
    
    
}
