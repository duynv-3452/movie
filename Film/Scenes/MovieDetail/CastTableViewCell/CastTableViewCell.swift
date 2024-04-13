//
//  CastTableViewCell.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var castTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource = [Cast]() {
        didSet {
            collectionView.reloadData()
        }
    }
//    var casts: [Cast]?
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 150, height: collectionView.frame.height - 24 )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CastCell", bundle: nil), forCellWithReuseIdentifier: "CastCell")
        
    }
    
    func prepareDatasource(data: [Cast]) {
        self.dataSource = data
    }
}

extension CastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.configCell(info: dataSource[indexPath.row])
        return cell
    }
}
