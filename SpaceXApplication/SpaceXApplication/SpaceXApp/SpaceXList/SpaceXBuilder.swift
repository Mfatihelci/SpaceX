//
//  SpaceXBuilder.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import Foundation
import Alamofire

final class SpaceListBuilder {
    static func make() -> SpaceXViewController {
        let view = SpaceXViewController()
        view.viewModel = SpaceListViewModel(service: SpaceService())
        return view
    }
}
