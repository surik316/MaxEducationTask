////
///  ListViewController.swift
////  MaxEducationTask
////
////  Created by Максим Сурков on 23.04.2021.
////


import Foundation
import UIKit
import Kingfisher

class ListViewController: UIViewController, UISearchBarDelegate{
    
    var presenter: ListViewPresenterProtocol!
    private let tableView = UITableView()
    private let refresh = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UserDefaults.standard.setValue("GDKG2dY2WUfdgTc80eoxAdlAF3GPxC1G", forKey: "apiToken")
        loadStocksData()
        setupTableView()
        configureRefresh()
        configureNavBar()
    }
    private func configureNavBar() {
        navigationItem.title = "MaximumEducation"
    }
    private func configureRefresh() {
        tableView.addSubview(refresh)
        refresh.tintColor = .systemBlue
        refresh.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }
    
    private func loadStocksData() {
        presenter.fetchNewsData()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  130.0
        tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.separatorColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func refreshAction() {
        refresh.endRefreshing()
        presenter.fetchNewsData()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.storageNews?.num_results ?? 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = view.backgroundColor
            return headerView
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = presenter.storageNews?.results[indexPath.row]
        let viewController = ListBuilder.createAddInfoModule(modelNews: model ?? News())
        navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for:  indexPath) as!
        CustomCell
        
        var news: News?
        news = presenter.storageNews?.results[indexPath.row]
        if news?.media.count ?? 0 > 0 {
            cell.newsImageView.kf.setImage(with: URL(string: news?.media[0].mediaMetadata[2].url ?? ""), placeholder: UIImage(named: "noImage"))
        } else {
            cell.newsImageView.image = UIImage(named: "noImage")
        }
        cell.newsImageView.kf.indicatorType = .activity
        cell.titleLabel.text = news?.title
        var titleText = ""
        news?.desFacet.forEach({ (tag) in
            titleText = titleText + (tag!) + ", "
        })
        cell.tagsLabel.text = titleText
        return cell
    }
}


extension ListViewController: ListViewProtocol{
    func succes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failure(error: Error) {
        print("ViewController: \(error.localizedDescription)")
    }
}
