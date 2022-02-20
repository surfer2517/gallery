//
//  HomeViewModel.swift
//  Gallery
//
//  Created by Ivan Rybkin on 19.02.2022.
//

import UIKit

class HomeViewModel {
    
    private let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    private let titles = ["Nature", "Beaches", "Outdoor", "Playground", "Fun"]
    // MARK: - CollectionView DataSource
    func numberOfRows() -> Int {
        return 20
    }
    
    func modelFor(row: Int) -> CarousalCollectionCell.Model {
        let randomImages = imageNames.random(4)
        let title = titles.randomElement()
        let like = [true, false].randomElement() ?? false
        let carousalModel = CarousalView.Model(images: randomImages)
        let model = CarousalCollectionCell.Model(title: title,
                                                 description: "This is demo",
                                                 liked: like,
                                                 model: carousalModel)
        return model
    }
}

extension Collection {
    private func choose(_ ram: Int) -> ArraySlice<Element> { shuffled().prefix(ram) }
    
    func random(_ ram: Int) -> [UIImage] {
        let names = choose(ram)
        let images = names.map { return UIImage(named: $0 as! String)! }
        return images
    }
}
