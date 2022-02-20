//
//  CarousalCollectionCell.swift
//  Gallery
//
//  Created by Ivan Rybkin on 19.02.2022.
//

import UIKit

class CarousalCollectionCell: UICollectionViewCell {
    static let identifier = "CarousalCollectionCell"
    
    private lazy var carousalView: CarousalView = {
        let frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        let carousalView = CarousalView(frame: frame)
        contentView.addSubview(carousalView)
        carousalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return carousalView
    }()
    
    var cellModel: Model? {
        didSet {
            carousalView.model = cellModel?.model
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct Model {
        var title: String?
        var description: String?
        var liked: Bool?
        var model: CarousalView.Model?
    }
    override func prepareForReuse() {
        cellModel = nil
    }
}
