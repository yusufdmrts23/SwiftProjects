//
//  RegionDataSourceDelegate.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation
protocol RegionDataSourceDelegate: AnyObject {
    func loadRegions(regions: [Region])
}
