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
    
    private lazy var topCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .blue
        view.textColor = .white
        view.text = "This app was created for testing SnapKit and RxSwift"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.font = .preferredFont(forTextStyle: .title1)
        return view
    }()
    
    private lazy var centerLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .gray
        view.text = "Center Label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var leadingCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Leading Label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var trailingCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Trailing Label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var aboveCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Label above center view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var belowCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .red
        view.text = "Label below center view"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var bottomLeftButton: UIButton = {
        let view = UIButton()
        view.setTitle("Press me", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        view.addTarget(self, action: #selector(buttonTapHandle), for: .touchUpInside)
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
        view.addSubview(topCenterLabel)
        view.addSubview(centerLabel)
        view.addSubview(leadingCenterLabel)
        view.addSubview(trailingCenterLabel)
        view.addSubview(aboveCenterLabel)
        view.addSubview(belowCenterLabel)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        topCenterLabel.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top)
            make.width.equalTo(view.snp.width)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        bottomLeftButton.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-50)
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom).offset(-50)
        }
        centerLabel.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        leadingCenterLabel.snp.makeConstraints { make in
            make.top.equalTo(centerLabel.snp.top)
            make.bottom.equalTo(centerLabel.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(centerLabel.snp.leading)
        }
        trailingCenterLabel.snp.makeConstraints { make in
            make.top.equalTo(centerLabel.snp.top)
            make.bottom.equalTo(centerLabel.snp.bottom)
            make.leading.equalTo(centerLabel.snp.trailing)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        aboveCenterLabel.snp.makeConstraints { make in
            make.bottom.equalTo(centerLabel.snp.top).offset(-40)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        belowCenterLabel.snp.makeConstraints { make in
            make.top.equalTo(centerLabel.snp.bottom).offset(40)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-50)
            make.centerX.equalTo(view.snp.centerX)
        }
        
    }
    
    @objc func buttonTapHandle() {
        
        bottomLeftButton.isSelected.toggle()
        
        UIView.animate(withDuration: 1.5) {
            self.aboveCenterLabel.alpha = self.bottomLeftButton.isSelected ? 0.3 : 1.0
        }
        
    }
    
}

