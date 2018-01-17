//
//  CustomCell.swift
//  CollectionViewPercentages
//
//  Created by Jan Senderek on 1/17/18.
//  Copyright © 2018 Jan Senderek. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let graph: CircularGraph = {
        let graph = CircularGraph()
        graph.translatesAutoresizingMaskIntoConstraints = false
        return graph
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(graph)
        graph.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        graph.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        graph.heightAnchor.constraint(equalToConstant: 100).isActive = true
        graph.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
