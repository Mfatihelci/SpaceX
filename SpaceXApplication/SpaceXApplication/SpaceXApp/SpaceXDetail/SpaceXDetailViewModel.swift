//
//  SpaceXDetailViewModel.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import Foundation
import Alamofire

final class SpaceDetailViewModel: SpaceDetailViewModelProtocol {
    var view: SpaceDetailViewModelDelegate?
    var space: WelcomeElement?
    init(view: SpaceDetailViewModelDelegate,space: WelcomeElement){
        self.view = view
        self.space = space
    }
    func load() {
        view?.update(value: space!)
    }
}
