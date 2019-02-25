//
//  LoadingView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    //MARK: UI
    var conView1 = UIView()
    var conView2 = UIView()
    var conView3 = UIView()
    var conView4 = UIView()
    var conView5 = UIView()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Function
    private func createView() {
        backgroundColor = .white
        
        createConView(conView: conView1, yAxisAnchor: topAnchor, topAnchorConstant: 20, heightConstant: 120, rightConstant: 8)
        createConView(conView: conView2, yAxisAnchor: conView1.bottomAnchor, topAnchorConstant: 20, heightConstant: 60, rightConstant: 8)
        createConView(conView: conView3, yAxisAnchor: conView2.bottomAnchor, topAnchorConstant: 30, heightConstant: 30, rightConstant: 40)
        createConView(conView: conView4, yAxisAnchor: conView3.bottomAnchor, topAnchorConstant: 12, heightConstant: 30, rightConstant: 40)
        createConView(conView: conView5, yAxisAnchor: conView4.bottomAnchor, topAnchorConstant: 30, heightConstant: 30, rightConstant: 100)
    }
    
    private func createConView(conView: UIView, yAxisAnchor: NSLayoutYAxisAnchor, topAnchorConstant: CGFloat, heightConstant: CGFloat, rightConstant: CGFloat) {
        addSubview(conView)
        conView.anchorViewWithConstantsTo(top: yAxisAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: topAnchorConstant, leftConstant: 8, bottomConstant: 0, rightConstant: rightConstant)
        conView.anchorViewWithHeightConstant(height: heightConstant)
        conView.backgroundColor = UIColor.rgb(red: 247, green: 247, blue: 247)
        
        let view = UIView()
        conView.addSubview(view)
        view.anchorViewTo(top: conView.topAnchor, left: conView.leftAnchor, bottom: conView.bottomAnchor, right: conView.rightAnchor)
        layoutIfNeeded()
        addShimmerView(shimmerView: view)
    }
    
    private func addShimmerView(shimmerView: UIView) {
        shimmerView.backgroundColor = UIColor.rgb(red: 223, green: 227, blue: 238)
        shimmerView.clipsToBounds = true
        shimmerView.layer.cornerRadius = 5

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.8, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.7)
        gradientLayer.frame = shimmerView.bounds
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 1.5
        animation.fromValue = -shimmerView.frame.size.width
        animation.toValue = shimmerView.frame.size.width
        animation.repeatCount = .infinity
        
        gradientLayer.add(animation, forKey: "")
        shimmerView.layer.mask = gradientLayer
    }
}
