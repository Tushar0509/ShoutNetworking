//
//  CustomCell.swift
//  ShoutNetworking
//
//  Created by Tushar Elangovan on 01/02/22.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell{
    
    lazy var ImgView: UIImageView = {
        let l = UIImageView()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.contentMode = .scaleAspectFit
        return l
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     //   contentView.backgroundColor = .green
        
        contentView.addSubview(ImgView)
        contentView.layer.cornerRadius = contentView.frame.width/14
        NSLayoutConstraint.activate([
            ImgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ImgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        //setuplayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
