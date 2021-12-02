//
//  ViewController.swift
//  TestSnapKitAndRxSwift
//
//  Created by  Buxlan on 12/2/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var bottomLeftButton: UIButton = {
        let view = UIButton()
        view.setTitle("Press me", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        return view
    }()
    
    private lazy var centerView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .gray
        view.text = "Center view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var leadingCenterView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Leading view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var trailingCenterView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Trailing view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var aboveCenterView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "View above center view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var belowCenterView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "View below center view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Lifecircle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

// MARK: - Helper methods

extension ViewController {
    
    private func configureUI() {
        view.addSubview(bottomLeftButton)
        view.addSubview(centerView)
        view.addSubview(leadingCenterView)
        view.addSubview(trailingCenterView)
        view.addSubview(aboveCenterView)
        view.addSubview(belowCenterView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        bottomLeftButton.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-50)
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom).offset(-50)
        }
        centerView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        leadingCenterView.snp.makeConstraints { make in
            make.top.equalTo(centerView.snp.top)
            make.bottom.equalTo(centerView.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(centerView.snp.leading)
        }
        trailingCenterView.snp.makeConstraints { make in
            make.top.equalTo(centerView.snp.top)
            make.bottom.equalTo(centerView.snp.bottom)
            make.leading.equalTo(centerView.snp.trailing)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        aboveCenterView.snp.makeConstraints { make in
            make.bottom.equalTo(centerView.snp.top).offset(-40)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        belowCenterView.snp.makeConstraints { make in
            make.top.equalTo(centerView.snp.bottom).offset(40)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
    }
    
}

