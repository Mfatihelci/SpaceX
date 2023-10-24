//
//  SpaceXViewModel.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//

import Foundation
import Alamofire

 class SpaceListViewModel: SpaceListViewModelProtocol {
    var spaceList: [WelcomeElement] = []
    var delegate: SpaceListViewModelDelegate?
    private let service: spaceXServiceProtocol?
     
     init(service: spaceXServiceProtocol) {
         self.service = service
     }
    func load() {
        service?.fetchAllDatas(response: { [delegate] (rocket) in
            guard let data = rocket else {return}
            delegate?.handleViewModelOutput(.showSpaceList(data))
            self.spaceList = data
        })
    }
}
