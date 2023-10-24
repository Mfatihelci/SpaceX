//
//  SpaceXViewController.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//

import UIKit
import SnapKit

class SpaceXViewController: UIViewController, tableViewProviderDelegate {
    private let TableViewSpace: UITableView = UITableView()
    private let TableView: TableViewProvider = TableViewProvider()
    var viewModel: SpaceListViewModelProtocol?
    private var rockets: [WelcomeElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
        initService()
        initDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.load()
    }
    private func initDelegate(){
        TableViewSpace.register(SpaceXTableViewCell.self, forCellReuseIdentifier: SpaceXTableViewCell.Identifier.ID.rawValue)
        TableViewSpace.delegate = TableView
        TableViewSpace.dataSource = TableView
        TableView.delegate = self
    }
    private func initService() {
        configure()
        drawDesing()
        setupUI()
    }
    private func configure() {
        view.addSubview(TableViewSpace)
        makeTableViewSpace()
    }
    private func drawDesing() {
        TableViewSpace.backgroundColor = .white
        view.backgroundColor = .white
        self.title = "SpaceX Rockets"
    }
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(sort))
    }
    @objc func sort() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let sortDesc = UIAlertAction(title: "Sort By Year Descending", style: .default,handler: { [weak self] _ in
            guard let self = self else { return }
            let sorted = self.rockets.sorted { (first, second) -> Bool in
                let firstYear = Int(first.launchYear ?? "") ?? 0
                let secondYear = Int(second.launchYear ?? "") ?? 0
                return firstYear < secondYear
            }
            self.TableView.update(value: sorted)
            self.TableViewSpace.reloadData()
        })
        let sortAsc = UIAlertAction(title: "Sort By Year Ascending", style: .default,handler: { [weak self] _ in
            guard let self = self else { return }
            let sorted = self.rockets.sorted { (first, second) -> Bool in
                let firstYear = Int(first.launchYear ?? "") ?? 0
                let secondYear = Int(second.launchYear ?? "") ?? 0
                return firstYear > secondYear
            }
            self.TableView.update(value: sorted)
            self.TableViewSpace.reloadData()
        })
        let cancel = UIAlertAction(title: "cancel", style: .cancel,handler: nil)
        actionSheet.addAction(sortDesc)
        actionSheet.addAction(sortAsc)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
    func onSelected(value: WelcomeElement) {
        let viewController = SpaceDetailBuilder.make(value: value)
        show(viewController, sender: nil)
    }
}
extension SpaceXViewController: SpaceListViewModelDelegate {
    func handleViewModelOutput(_ output: SpaceViewModelOutput) {
        switch output {
        case .showSpaceList(let list):
            TableView.update(value: list)
            DispatchQueue.main.async {
                self.rockets = list
                self.TableViewSpace.reloadData()
            }
        }
    }
}
extension SpaceXViewController {
    private func makeTableViewSpace() {
        TableViewSpace.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
