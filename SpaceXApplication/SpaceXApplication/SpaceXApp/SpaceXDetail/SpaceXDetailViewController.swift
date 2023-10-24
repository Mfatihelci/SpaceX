//
//  SpaceXDetailViewController.swift
//  SpaceXApplication
//
//  Created by fatih on 17.07.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class SpaceXDetailViewController: UIViewController {
    private let kapak: UIImageView = UIImageView()
    private let name: UILabel = UILabel()
    private let rocketType: UILabel = UILabel()
    private let launchdate: UILabel = UILabel()
    private let wikiButton: UIButton = UIButton()
    private let youtubeButton: UIButton = UIButton()
    private let details: UILabel = UILabel()
    private var wikiurl: String = ""
    private var youtubeurl: String = ""
    var viewModel: SpaceDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.load()
        configure()
        drawDesing()
        WikiClickButton()
        YoutubeClickButton()
    }
    private func configure(){
        view.addSubview(kapak)
        view.addSubview(name)
        view.addSubview(rocketType)
        view.addSubview(launchdate)
        view.addSubview(wikiButton)
        view.addSubview(youtubeButton)
        view.addSubview(details)
        makeKapak()
        makeName()
        makeRocketType()
        makeLaunchDate()
        makeWikiButton()
        makeYoutubeButton()
        makeDetails()
    }
    private func drawDesing(){
        view.backgroundColor = .init(white: 0.95, alpha: 1)
        launchdate.font = .boldSystemFont(ofSize: 20)
        name.font = .boldSystemFont(ofSize: 20)
        rocketType.font = .boldSystemFont(ofSize: 20)
        details.font = .boldSystemFont(ofSize: 20)
        details.numberOfLines = 0
        self.title = "Detail"
        wikiButton.setTitle("Wikipedia", for: .normal)
        wikiButton.setTitleColor(UIColor.black , for: .normal)
        wikiButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        wikiButton.layer.cornerCurve = .continuous
        wikiButton.clipsToBounds = true
        wikiButton.backgroundColor = UIColor.systemBlue
        wikiButton.layer.cornerRadius = 10
        youtubeButton.setTitle("Youtube", for: .normal)
        youtubeButton.setTitleColor(UIColor.black , for: .normal)
        youtubeButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        youtubeButton.layer.cornerCurve = .continuous
        youtubeButton.clipsToBounds = true
        youtubeButton.backgroundColor = UIColor.red
        youtubeButton.layer.cornerRadius = 10
    }
    
    func WikiClickButton(){
        wikiButton.addTarget(self, action: #selector(clickUrl), for: .touchUpInside)
    }
     @objc func clickUrl(){
        if let url = URL(string: "\(wikiurl)") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    func YoutubeClickButton(){
        youtubeButton.addTarget(self, action: #selector(clickUrl2), for: .touchUpInside)
    }
     @objc func clickUrl2(){
        if let url = URL(string: "\(youtubeurl)") {
             UIApplication.shared.open(url, options: [:])
         }
    }
}
extension SpaceXDetailViewController: SpaceDetailViewModelDelegate {
    func update(value: WelcomeElement) {
        name.text = value.missionName
        rocketType.text = value.rocket?.rocketType?.rawValue
        launchdate.text = value.launchDateUTC
        details.text = value.details
        kapak.af.setImage(withURL: URL(string: value.links?.missionPatchSmall ?? "")!)
        wikiurl = value.links?.wikipedia ?? " "
        youtubeurl = value.links?.videoLink ?? " "
    }
}
extension SpaceXDetailViewController {
    private func makeKapak(){
        kapak.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }
    private func makeName(){
        name.snp.makeConstraints { make in
            make.top.equalTo(kapak.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    private func makeRocketType(){
        rocketType.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    private func makeLaunchDate(){
        launchdate.snp.makeConstraints { make in
            make.top.equalTo(rocketType.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    private func makeWikiButton(){
        wikiButton.snp.makeConstraints { make in
            make.top.equalTo(launchdate.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
        }
    }
    private func makeYoutubeButton(){
        youtubeButton.snp.makeConstraints { make in
            make.top.equalTo(wikiButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
        }
    }
    private func makeDetails(){
        details.snp.makeConstraints { make in
            make.top.equalTo(youtubeButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
        }
    }
}
