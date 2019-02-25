//
//  OutputCollectionCell.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class OutputCollectionViewCell: UICollectionViewCell {
    
    //MARK: UI
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var formLabel: UILabel!
    
    //MARK: Property
    var viewModel: OutputCellViewModel? {
        didSet {
            setupWordText()
            formLabel.text = viewModel?.pos
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        createView()
    }
    
    private func createView() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.cornerRadius = 5
    }
    
    private func setupWordText() {
        guard let vm = viewModel else { return }
        let mutableAttributedString = NSMutableAttributedString(string: vm.surface, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        let attributedString = NSAttributedString(string: " \(vm.reading)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        mutableAttributedString.append(attributedString)
        wordLabel.attributedText = mutableAttributedString
    }
}
