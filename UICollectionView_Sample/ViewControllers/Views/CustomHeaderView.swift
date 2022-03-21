//
//  CustomHeaderView.swift
//  UICollectionView_Sample
//
//  Created by Nechaev Sergey  on 21.03.2022.
//

import UIKit

class CustomHeaderView: UICollectionViewCell {
    
    weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        setupConstraints(label)
        
        textLabel = label
        
        contentView.backgroundColor = .blue
        textLabel.textAlignment = .center
        textLabel.text = "Header"
    }
    
    private func setupConstraints(_ object: UILabel) {
        NSLayoutConstraint.activate([
            object.topAnchor.constraint(equalTo: contentView.topAnchor),
            object.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            object.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            object.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

