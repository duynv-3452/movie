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
    var topRatedMovies: [Movie] = []
    var upComingMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    
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
        tableView.register(UINib(nibName: "SearchCell", bundle: nil),
                           forCellReuseIdentifier: "SearchCell")
        tableView.register(UINib(nibName: "ListMovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ListMovieTableViewCell")
        tableView.register(UINib(nibName: "MovieHeader", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "MovieHeader")
    }
    
    private func getMovies() {
        let popularURL = Urls.shared.getPopularUrl()
        APICaller.shared.getMovies(urlString: popularURL) { [weak self] movies in
            guard let self else { return }
            DispatchQueue.main.async {
                self.popularMovies = movies
                print("-----\(popularURL)")
                print("-----\(movies.count)")
                self.tableView.reloadData()
            }
        }
        
        let topRatedURL = Urls.shared.getTopRatedUrl()
        APICaller.shared.getMovies(urlString: topRatedURL) { [weak self] movies in
            guard let self else { return }
            DispatchQueue.main.async {
                self.topRatedMovies = movies
                print("-----\(topRatedURL)")
                print("-----\(movies.count)")
                self.tableView.reloadData()
            }
        }
        
        let upComingURL = Urls.shared.getUpComingUrl()
        APICaller.shared.getMovies(urlString: upComingURL) { [weak self] movies in
            guard let self else { return }
            DispatchQueue.main.async {
                self.upComingMovies = movies
                self.tableView.reloadData()
            }
        }
        
        let nowPlayingURL = Urls.shared.getNowPlayingUrl()
        APICaller.shared.getMovies(urlString: nowPlayingURL) { [weak self] movies in
            guard let self else { return }
            DispatchQueue.main.async {
                self.nowPlayingMovies = movies
                self.tableView.reloadData()
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
        if indexPath.section == 0 {
            cell.configCell(movies: popularMovies)
        } else if indexPath.section == 1 {
            cell.configCell(movies: topRatedMovies)
        } else if indexPath.section == 2 {
            cell.configCell(movies: upComingMovies)
        } else {
            cell.configCell(movies: nowPlayingMovies)
        }
        cell.tappedMovie = { [weak self] movie in
            guard let self else { return }
            self.toMovieDetailScreen(movie: popularMovies[indexPath.row])
            
        }
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

extension HomeViewController {
    func toMovieDetailScreen(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
}
