//
//  DownloadPicsumImageViewModelTests.swift
//  PicsumPhotosTests
//
//  Created by Amith Narayan on 28/07/2021.
//

import XCTest
@testable import PicsumPhotos

class DownloadPicsumImageViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testDownloadPicsumImageViewModelTests() {
        let url = "https://picsum.photos/id/0/5616/3744"
        let key = "0"
        let downloadPicsumImageViewModel = DownloadPicsumImageViewModel(url: url, key: key)
        
        XCTAssertEqual(url, downloadPicsumImageViewModel.imageUrlString)
        XCTAssertEqual(key, downloadPicsumImageViewModel.imageKey)
        
        
    }
}
