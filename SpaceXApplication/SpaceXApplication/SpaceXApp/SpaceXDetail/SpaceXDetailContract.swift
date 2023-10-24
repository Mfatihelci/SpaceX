//
//  SpaceXDetailContract.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import Foundation

protocol SpaceDetailViewModelProtocol {
    func load()
}
protocol SpaceDetailViewModelDelegate {
    func update(value: WelcomeElement)
}
