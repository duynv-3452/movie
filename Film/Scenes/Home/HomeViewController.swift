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
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
            cell.tappedSearch = { [weak self] in
                guard let self else { return }
                self.toSearchMovieScreen()
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
            cell.configCell(movies: popularMovies)
            cell.tappedMovie = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            return cell
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
            cell.configCell(movies: topRatedMovies)
            cell.tappedMovie = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            return cell
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
            cell.configCell(movies: upComingMovies)
            cell.tappedMovie = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
            cell.configCell(movies: nowPlayingMovies)
            cell.tappedMovie = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        } else {
            return 290
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let movieHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as! MovieHeader
        if section == 0 {
//            movieHeader.configView(title: "Welcome")
            return nil
        } else if section == 1 {
            movieHeader.configView(title: "Popular")
        } else if section == 2 {
            movieHeader.configView(title: "Top Rated")
        } else if section == 3{
            movieHeader.configView(title: "Up coming")

        } else {
            movieHeader.configView(title: "Now playing")
        }
        return movieHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 44
        }    }
}

extension HomeViewController {
    func toMovieDetailScreen(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.loadData(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func toSearchMovieScreen() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
