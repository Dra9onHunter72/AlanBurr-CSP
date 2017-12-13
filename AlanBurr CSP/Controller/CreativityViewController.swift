//
//  File.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/8/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class CreativityViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsperRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "Destiny Hydra"),
            UIImage(named: "DOOM title"),
            UIImage(named: "DOOM pinky"),
            UIImage(named: "Leviathan"),
            UIImage(named: "lego man"),
            UIImage(named: "DOOM2"),
            UIImage(named: "HappyChild"),
            UIImage(named: "pokemon"),
            UIImage(named: "BadSpaceShip1"),
            UIImage(named: "GoodSpaceShip")
        ]
    }()
    
    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates(
                {
                    self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath  = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath, at: .centeredVertically, animated: true)
                }
            }
        }
    }
    
    //MARK:- Lifecycle methods
    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK:- UICollectionView methods
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        numberOfItemsInSection section: Int) -> Int
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .purple
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
    
    //MARK:- Delegate method
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath == largePhotoIndexPath
        {
            let art = artSelection[indexPath.row]
            let size = collectionView.bounds.size
            let widthScale = (size.width / art!.size.width) * CGFloat(0.80)
            let largeSize = CGSize(width: art!.size.width * widthScale, height: art!.size.height * widthScale)
            
            return largeSize
        }
        
        let paddingSpace = sectionInsets.left * (itemsperRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsperRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        if largePhotoIndexPath == indexPath
        {
            largePhotoIndexPath = nil
        }
        else
        {
            largePhotoIndexPath = indexPath
        }
        
        return false
    }
}
