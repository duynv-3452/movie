//
//  ActorViewController.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/16/24.
//

import UIKit

class ActorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var idActor: Int?
    private var actor = Actor()
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getActorDetail()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ActorInfoCell", bundle: nil),
                           forCellReuseIdentifier: "ActorInfoCell")
        tableView.register(UINib(nibName: "ListMovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ListMovieTableViewCell")
    }
    
    private func getActorDetail() {
        guard let id = idActor else { return }
        APICaller.shared.getActorDetail(id: id) { [weak self] actor in
            guard let self else { return }
            DispatchQueue.main.async {
                self.actor = actor
                self.tableView.reloadData()
            }

        }
    }
}


extension ActorViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorInfoCell", for: indexPath) as! ActorInfoCell
            cell.configCell(actor: actor)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
            cell.configCell(movies: actor.movieCredits?.movies ?? [])
            cell.tappedMovie = { [weak self] movie in
                guard let self else { return }
                self.toMovieDetailScreen(movie: movie)
            }
            return cell
            
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

extension ActorViewController {
    func toMovieDetailScreen(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.loadData(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}
