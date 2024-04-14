//
//  MovieDetailViewController.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var movie: Movie? {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MovieDetailInfoCell", bundle: nil), forCellReuseIdentifier: "MovieDetailInfoCell")
        tableView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
        tableView.register(UINib(nibName: "SimilarTableViewCell", bundle: nil), forCellReuseIdentifier: "SimilarTableViewCell")

    }
    
    func loadData(movie: Movie) {
        guard let id = movie.id else { return }
         getMovieDetail(id: id)
    }

    private func getMovieDetail(id: Int) {
        loading(true)
        APICaller.shared.getMovieDetail(id: id) { [weak self] movieDetail in
            guard let self else { return }
            DispatchQueue.main.async {
                self.movie = movieDetail
            }
            self.loading(false)
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailInfoCell", for: indexPath) as! MovieDetailInfoCell
            guard let movieDetail = movie else { return UITableViewCell() }
            cell.configCell(movie: movieDetail)
            cell.selectionStyle = .none

            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            guard let movieDetail = movie else { return UITableViewCell() }
            cell.prepareDatasource(data: movieDetail.credits?.cast ?? [])
            cell.selectionStyle = .none

            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarTableViewCell", for: indexPath) as! SimilarTableViewCell
            guard let movieDetail = movie else { return UITableViewCell() }
            cell.configCell(data: movieDetail.similar?.results ?? [])
            cell.tappedSimilar = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            cell.selectionStyle = .none

            return cell
        }
        return UITableViewCell()
    }
}

extension MovieDetailViewController {
    func toMovieDetailScreen(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.loadData(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}
