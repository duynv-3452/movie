//
//  SearchViewController.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var dataSource = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    private func configView() {
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SearchMovieCell", bundle: nil), forCellReuseIdentifier: "SearchMovieCell")
    }
    
    private func searchMovie(name: String, page: Int) {
        loading(true)
        APICaller.shared.searchMovie(query: name, page: page) { [weak self] movies in
            guard let self else { return }
            DispatchQueue.main.async {
                self.dataSource = movies
            }
            self.loading(false)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieCell", for: indexPath) as! SearchMovieCell
        cell.configCell(movie: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toMovieDetailScreen(movie: dataSource[indexPath.row])
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataSource = []
        } else {
            searchMovie(name: searchText, page: 1)
        }
    }
}

extension SearchViewController {
    func toMovieDetailScreen(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.loadData(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}
