//
//  OutputCollectionController+CollectionView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

extension OutputCollectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.words?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutputCollectionViewCell", for: indexPath) as! OutputCollectionViewCell
        cell.viewModel = viewModel.words?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 24, height: 76)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "OutputHeaderCell", for: indexPath) as! OutputHeaderCell
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let inputHeight = 40 + viewModel.getInputTextHeight()
        let outputHeight = 40 + viewModel.getOutputTextHeight()
        let height = inputHeight + outputHeight
        return CGSize(width: view.frame.width - 24, height: height)
    }
    
}
