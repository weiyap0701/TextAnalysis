//
//  OutputViewController.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class OutputCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: UI
    var loadingView: LoadingView!
    var errorView: ErrorView!
    
    //MARK: Property
    var viewModel: TextAnalysisViewModel!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavBar()
        createErrorView()
        createLoadingView()
        setupViewModel()
        createCollectionView()
    }
    
    //MARK: Function
    private func createNavBar() {
        navigationItem.title = "解析結果"
    }
    
    private func createCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 12, bottom: 20, right: 12)
        collectionView.register(UINib(nibName: "OutputHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "OutputHeaderCell")
        collectionView.register(UINib(nibName: "OutputCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OutputCollectionViewCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    
    private func setupViewModel() {
        viewModel.analyseText()
        viewModel.dataUpdatedEvent.addObserver(collectionView) { [weak self] (collectionview) in
            DispatchQueue.main.async {
                collectionview.reloadData()
                self?.loadingView.removeFromSuperview()
                self?.displayErrorView()
            }
        }
    }
    
    private func displayErrorView() {
        errorView.isHidden = !viewModel.displayError
        errorView.setErrorText(text: viewModel.errorMessage)
    }
    
    private func createLoadingView() {
        loadingView = LoadingView(frame: view.frame)
        view.addSubview(loadingView)
        loadingView.anchorViewTo(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    private func createErrorView() {
        errorView = ErrorView()
        errorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorView)
        errorView.anchorViewTo(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
