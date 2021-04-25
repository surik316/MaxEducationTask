//
//  GalleryFlowLayout.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 25.04.2021.
//

import Foundation
import UIKit

class GalleryFlowLayout: UICollectionViewFlowLayout {
    
    var columns:Int = 3 {
        didSet {
            if columns != oldValue {
                invalidateLayout()
            }
        }
    }
    
    private let horizontalCellSpacing: CGFloat = 4
    private let verticalCellSpacing: CGFloat = 4
    
    var cache = [UICollectionViewLayoutAttributes]()

    var cellContentWidth: CGFloat {
        return (collectionView?.bounds.width ?? 0 - (horizontalCellSpacing * CGFloat(columns - 1)))/CGFloat(columns)
    }
    
    var cellContentHeight:CGFloat {
        return cellContentWidth
    }
    
    public var contentHeight: CGFloat {
        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0
        let rows = numberOfItems / columns + (numberOfItems % columns == 0 ? 0:1)
        return (CGFloat(rows) * verticalCellSpacing) + (CGFloat(rows) * cellContentHeight)
    }
    
    override public var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.bounds.width ?? 0, height: contentHeight)
    }
    
    override public func prepare() {
        
        if !cache.isEmpty {
            return
        }
        
        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0
        
        for item in 0..<numberOfItems {
            
            let indexPath:IndexPath = IndexPath(item: item, section: 0)
            
            let columnIndex = indexPath.row % columns
            let rowIndex = indexPath.row / columns
            
            // create a frame for the item
            let x = CGFloat(columnIndex) * horizontalCellSpacing + (cellContentWidth * CGFloat(columnIndex))
            let y = CGFloat(rowIndex) * verticalCellSpacing + (cellContentHeight * CGFloat(rowIndex))
            
            let itemRect = CGRect(
                x: x,
                y: y,
                width: cellContentWidth,
                height: cellContentHeight)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = itemRect
            cache.append(attributes)
        }
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return cache[indexPath.row]
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}
