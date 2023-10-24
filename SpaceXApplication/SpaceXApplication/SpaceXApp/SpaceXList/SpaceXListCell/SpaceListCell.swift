//
//  SpaceListCell.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class SpaceXTableViewCell: UITableViewCell {
    private let KapakFoto: UIImageView = UIImageView()
    private let SpaceName: UILabel = UILabel()
    private let SpaceYears: UILabel = UILabel()
    enum Identifier: String {
        case ID = "Cell"
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        drawDesing()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        addSubview(KapakFoto)
        addSubview(SpaceName)
        addSubview(SpaceYears)
        makeKapakFoto()
        makeSpaceName()
        makeSpaceYears()
    }
    private func drawDesing(){
        SpaceName.textColor = .black
        SpaceYears.textColor = .black
        SpaceName.font = .boldSystemFont(ofSize: 18)
        SpaceYears.font = .boldSystemFont(ofSize: 18)
    }
    func saveModel(data: WelcomeElement){
        SpaceName.text = "Rocket Name: \(data.missionName!)"
        SpaceYears.text = "Space Years: \(data.launchYear!)"
        
        guard let imageurl = URL(string: data.links?.missionPatchSmall ?? "") else {
            return
        }
        KapakFoto.af.setImage(withURL: imageurl)
    }
}
extension SpaceXTableViewCell {
    private func makeKapakFoto(){
        KapakFoto.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(120)
            make.width.equalTo(140)
        }
    }
    private func makeSpaceName(){
        SpaceName.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(KapakFoto.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    private func makeSpaceYears(){
        SpaceYears.snp.makeConstraints { make in
            make.top.equalTo(SpaceName.snp.bottom).offset(10)
            make.left.equalTo(KapakFoto.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
}
