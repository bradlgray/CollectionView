//
//  ViewController.swift
//  IosInterview
//
//  Created by Brad Gray on 7/27/16.
//  Copyright © 2016 Brad Gray. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionArray = [String]()
    var images = GetRequest()

   
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        collectionView.dataSource = self

        
        self.images.downloadImages { () -> () in

           self.collectionArray.appendContentsOf(self.images.imageArray)
            self.collectionView.reloadData()

        
      }
self.collectionArray.appendContentsOf(self.images.imageArray)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print(collectionArray.count)
        return collectionArray.count
       
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let StartingCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? imageCell {
            
            
           
            let previewImg = collectionArray[indexPath.row]
            
            StartingCell.configureCell(previewImg)
            return StartingCell
        }
        
        return UICollectionViewCell()

        
    }
    
}

