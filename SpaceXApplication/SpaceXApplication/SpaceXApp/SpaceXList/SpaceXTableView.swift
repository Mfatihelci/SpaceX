//
//  SpaceXTableView.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import UIKit
import Alamofire

final class TableViewProvider: NSObject {
    private var spaceList: [WelcomeElement] = []
    var delegate: tableViewProviderDelegate?
    private var detail: [WelcomeElement] = []
    
    func removo() {
        spaceList.removeAll()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let space = spaceList[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpaceXTableViewCell.Identifier.ID.rawValue) as? SpaceXTableViewCell else {
            return UITableViewCell()
        }
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.saveModel(data: space)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = spaceList[indexPath.row]
        delegate?.onSelected(value: data)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
extension TableViewProvider: UITableViewDelegate,UITableViewDataSource { }
extension TableViewProvider: tableViewProviderProtocol {
    func update(value: [WelcomeElement]) {
        self.spaceList = value
    }
}
