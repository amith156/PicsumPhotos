//
//  PicsumDownloadService.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import Foundation
import Combine

class PicsumDownloadService {
    
    
    static let picsumDownloadServiceInstance = PicsumDownloadService()
    
    @Published var picsumModels : Picsum = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        photoDownloadData()
    }
    

    
    func photoDownloadData() {

        let queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "limit", value: "100")
        ]
        
        guard let URL = getURLComponent(queryItems: queryItems) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: URL)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, responce) -> Data in
                guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: Picsum.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
                
                
            } receiveValue: { [weak self] (recivedPicsumArray) in
                print("=====> \(recivedPicsumArray.count)")
                self?.picsumModels = recivedPicsumArray
                
            }
            .store(in: &cancellables)

        
        
        
        
    }
    
    
    private func getURLComponent(queryItems: [URLQueryItem]) -> URL? {
        var url : URL? {
            var component = URLComponents()
            component.scheme = "https"
            component.host = "picsum.photos"
            component.path = "/v2/list"
            component.queryItems = queryItems
            
            return component.url
        }
        
        
        return url
    }
    
    
    
    
    
}
