//
//  SpaceXDetailBuilder.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import Foundation

final class SpaceDetailBuilder {
    static func make(value: WelcomeElement) -> SpaceXDetailViewController {
        let vc = SpaceXDetailViewController()
        let viewModel = SpaceDetailViewModel(view: vc, space: value)
        vc.viewModel = viewModel
        return vc
    }
}
