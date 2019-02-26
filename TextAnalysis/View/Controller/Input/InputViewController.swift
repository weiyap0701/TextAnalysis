//
//  InputViewController.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class InputViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: UI
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let analyseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("解析する", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.secondaryTeal()
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(analyseButtonPressed), for: .touchUpInside)
        return button
    }()
    var sampleView: SampleView!
    var inputTextView: InputTextView!
    
    //MARK: Property
    var viewModel = TextAnalysisViewModel()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavBar()
        createView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Function
    @objc private func keyboardWillShow() {
        let navBarheight = navigationController?.navigationBar.frame.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        scrollView.contentOffset.y = navBarheight + statusBarHeight
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentOffset.y = 0
    }
    
    @objc private func analyseButtonPressed() {
        if inputTextView.getText().count <= 0 {
            displayAlert()
            return
        }
        viewModel.inputText = inputTextView.getText()
        
        let vc = OutputCollectionController(collectionViewLayout: UICollectionViewFlowLayout())
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createNavBar() {
        navigationItem.title = "テキスト解析"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func createView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.anchorViewTo(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        createSampleView()
        createInputTextview()
        createAnaylseButton()
    }
    
    private func createSampleView() {
        sampleView = SampleView()
        scrollView.addSubview(sampleView)
        sampleView.anchorViewWithConstantsTo(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        sampleView.anchorViewWithHeightConstant(height: 120)
    }
    
    private func createInputTextview() {
        inputTextView = InputTextView()
        scrollView.addSubview(inputTextView)
        inputTextView.anchorViewWithConstantsTo(top: sampleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        inputTextView.anchorViewWithHeightConstant(height: 200)
    }
    
    private func createAnaylseButton() {
        scrollView.addSubview(analyseButton)
        analyseButton.anchorViewWithConstantsTo(top: inputTextView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        analyseButton.centerViewWithX(x: view.centerXAnchor)
        analyseButton.anchorViewWithHeightAndWidthConstant(height: 50, width: 120)
    }
    
    private func displayAlert() {
        let alertController = UIAlertController(title: nil, message: "入力は空にできません。", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
