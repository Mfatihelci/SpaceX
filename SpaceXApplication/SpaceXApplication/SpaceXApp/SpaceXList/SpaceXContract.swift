//
//  SpaceXContract.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//

import Foundation

protocol SpaceListViewModelProtocol {
    var delegate: SpaceListViewModelDelegate? { get set }
    func load()
}
enum SpaceViewModelOutput {
    case showSpaceList([WelcomeElement])
}
protocol SpaceListViewModelDelegate {
    func handleViewModelOutput(_ output: SpaceViewModelOutput)
}
//MARK: - TableViewProvider
protocol tableViewProviderProtocol {
    func update(value: [WelcomeElement])
}
protocol tableViewProviderDelegate {
    func onSelected(value: WelcomeElement)
}

