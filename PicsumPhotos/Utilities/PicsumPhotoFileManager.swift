//
//  PicsumPhotoFileManager.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import Foundation
import SwiftUI

class PicsumPhotoFileManager {
    
    static let instace = PicsumPhotoFileManager()
    private let folderName = "picsum_photos"
    
    
    
    private init() {
        createFolderIfNeeded()
    }
    
    
    
    
    private func createFolderIfNeeded() {
        
        guard let url = getFolderPath() else {
            return
        }
        
        //if not create a folder path
        if !FileManager.default.fileExists(atPath: url.path) {
            
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error in creating folder =====> \(error)")
            }
            
        }
    }
    
    
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
        
    }
    
    
    private func getImagePath(key: String) -> URL? {
        
        // .../picsum_photos/
        guard let folder = getFolderPath() else {
            return nil
        }
        
        // .../picsum_photos/image_name.png
        return folder.appendingPathComponent(key + ".png")
        
    }
    
    
    func add(key: String, value: UIImage) {
        
        guard let data = value.pngData(), let url = getImagePath(key: key) else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving the file manager =====> \(error)")
        }
        
        
    }
    
    
    
    func get(key: String) -> UIImage? {
        guard let url = getImagePath(key: key), FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    
    
}
