//
//  MovieDetailViewController.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var dataSource = Movie() {
        didSet {
            tableView.reloadData()
        }
    }
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieDetailInfoCell", bundle: nil), forCellReuseIdentifier: "MovieDetailInfoCell")
        tableView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
        tableView.register(UINib(nibName: "SimilarTableViewCell", bundle: nil), forCellReuseIdentifier: "SimilarTableViewCell")

    }
    
    func prepareDatasource() {
        self.dataSource = movie ?? Movie()
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
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as! CastTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarTableViewCell", for: indexPath) as! SimilarTableViewCell
            return cell
        }
        return UITableViewCell()
    }
}
