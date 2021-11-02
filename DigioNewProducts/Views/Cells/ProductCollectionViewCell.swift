//
//  ProductCollectionViewCell.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak fileprivate var innerView: UIView!
    @IBOutlet weak fileprivate var imageView: UIImageView!

    func setImage(_ imageUrl: String) {
        self.innerView.roundedWithShadow()
        self.imageView.setNetworkImage(imageUrl: imageUrl)
    }
}
