//
//  HomeViewController.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var popularMovies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getMovies()
    }
    
    private func configView() {
        title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ListMovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ListMovieTableViewCell")
        tableView.register(UINib(nibName: "MovieHeader", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "MovieHeader")
    }
    
    private func getMovies() {
        let popularURL = Urls.shared.getPopularUrl()
        APICaller.shared.getMovies(urlString: popularURL) { [weak self] movies in
            DispatchQueue.main.async {
                self?.popularMovies = movies
                print("-----\(popularURL)")
                print("-----\(movies.count)")
                self?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let movieHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as! MovieHeader
        if section == 0 {
            movieHeader.configView(title: "Popular")
        } else if section == 1 {
            movieHeader.configView(title: "Top Rated")
        } else if section == 2{
            movieHeader.configView(title: "Up coming")

        } else {
            movieHeader.configView(title: "Now playing")
        }
        return movieHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
