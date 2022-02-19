//
//  CarousalCollectionCell.swift
//  Gallery
//
//  Created by Ivan Rybkin on 19.02.2022.
//

import UIKit

class CarousalCollectionCell: UICollectionViewCell {
    static let identifier = "CarousalCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
