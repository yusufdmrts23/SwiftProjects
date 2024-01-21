//
//  DogDataSourceDelegate.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 20.11.2023.
//

import Foundation

protocol DogDataSourceDelegate: AnyObject {
    func breedListLoaded(breedList: [String])
}
