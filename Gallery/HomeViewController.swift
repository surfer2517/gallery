//
//  ViewController.swift
//  Gallery
//
//  Created by Ivan Rybkin on 19.02.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        collectionView.reloadData()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        let seacrhController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = seacrhController
        seacrhController.hidesNavigationBarDuringPresentation = false
        seacrhController.obscuresBackgroundDuringPresentation = false
        seacrhController.searchBar.delegate = self
    }

//    private lazy var searchBarView: UISearchController = {
//        let seacrhBar = UISearchController(searchResultsController: nil)
//        view.addSubview(seacrhBar)
//        seacrhBar.snp.makeConstraints {
//        $0.top.equalToSuperview().offset(1)
//        $0.bottom.equalToSuperview().offset(1)
//        $0.leading.equalToSuperview().offset(10)
//        $0.trailing.equalToSuperview().inset(10)
//    }
//        seacrhBar.contentMode = .scaleAspectFill
//        seacrhBar.clipsToBounds = true
//        return seacrhBar
//}()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collection)
        collection.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collection.register(CarousalCollectionCell.self,
                            forCellWithReuseIdentifier: CarousalCollectionCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .systemBlue
        return collection
        
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarousalCollectionCell.identifier, for: indexPath) as! CarousalCollectionCell
        cell.cellModel = viewModel.modelFor(row: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
