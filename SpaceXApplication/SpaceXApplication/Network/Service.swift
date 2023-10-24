//
//  Service.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//
import Foundation
import Alamofire

protocol spaceXServiceProtocol {
    func fetchAllDatas(response: @escaping ([WelcomeElement]?) -> Void)
}

public enum SpaceServiceEndPoint: String {
    case path_url = "https://api.spacexdata.com/v2/launches"
}

public class SpaceService: spaceXServiceProtocol {
    public init() { }
    func fetchAllDatas(response: @escaping ([WelcomeElement]?) -> Void) {
        AF.request(SpaceServiceEndPoint.path_url.rawValue).responseDecodable(of: [WelcomeElement].self) { (model) in
            guard let data = model.value else { return }
            response(data)
        }
    }
}
