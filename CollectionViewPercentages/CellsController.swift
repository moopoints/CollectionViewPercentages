//
//  ViewController.swift
//  CollectionViewPercentages
//
//  Created by Jan Senderek on 1/17/18.
//  Copyright © 2018 Jan Senderek. All rights reserved.
//

import UIKit

class CellsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let graphValues:[CGFloat] = [0.12, 0.35, 0.14, 1, 0.89]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Showing cellsController")
        collectionView?.backgroundColor = .lightGray
        navigationItem.title = "Cells"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(didPressReload))
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.graph.progressLayerStrokeEnd = graphValues[indexPath.row]
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return graphValues.count
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 156)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        return insets
    }
    
    
    @objc func didPressReload() {
        collectionView?.reloadData()
    }
}
