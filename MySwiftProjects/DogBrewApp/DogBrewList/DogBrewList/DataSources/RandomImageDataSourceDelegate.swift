//
//  RandomImageDataSourceDelegate.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 21.11.2023.
//

// RandomImageDataSourceDelegate.swift

import Foundation

protocol RandomImageDataSourceDelegate: AnyObject {
    func randomImageLoaded(imageURL: String)
}
