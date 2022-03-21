//
//  ViewController.swift
//  UICollectionView_Sample
//
//  Created by Nechaev Sergey  on 21.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    weak var mainCollectionView: UICollectionView!
    
    //Define reuse identifiers for header and footer
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let footerReuseIdentifier = "footerReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
    }
    
    private func setupCollection() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        //Register header and footer
        collectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerReuseIdentifier)
        
        mainCollectionView = collectionView
    }
}

// MARK: -- CollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    // numbers of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    // numbers of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    // defining item (cell)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        cell.textLabel.text = String(indexPath.row + 1)
        return cell
    }
}

    // MARK: -- CollectionViewDelegate

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //width and height of item, by default = 50x50pt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width - 10, height: 120)
    }
    
    // spacing between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    // sectional spacing
    // left and right insets are ignored
    // top bottom spacing from header \ footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    // MARK: -- Header and footer delegate settings
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! CustomHeaderView
            return headerCell
            
        case UICollectionView.elementKindSectionFooter:
            let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerReuseIdentifier, for: indexPath) as! CustomFooterView
            return footerCell
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    // For vertical collection view we must define height ( width for horizontal views )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 0, height: 100.0)
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: 0, height: 80.0)
    }
}
