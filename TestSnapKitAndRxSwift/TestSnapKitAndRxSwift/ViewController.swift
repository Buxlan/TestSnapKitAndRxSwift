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
    
    private lazy var textView: UITextView = {
        let view = UITextView()
        view.text = "Флагманское телемедицинское решение компании является крупнейшим в стране по количеству подключенных пользователей. Его используют ДЗМ г. Москвы, «Доктор рядом», ГК «Эксперт», «Лечебный центр», ФНКЦ ФМБА России и другие медицинские организации."
        view.backgroundColor = .black
        view.textAlignment = .center
        view.textColor = .white
        view.font = .preferredFont(forTextStyle: .headline)
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
        view.backgroundColor = .lightGray
        view.text = "Leading Label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var trailingCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .lightGray
        view.text = "Trailing Label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var aboveCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .lightGray
        view.text = "Label above center label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var belowCenterLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .lightGray
        view.text = "Label below center label"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var changeTextButton: UIButton = {
        let view = UIButton()
        view.setTitle("Change text of text view", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.contentEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
        view.addTarget(self, action: #selector(buttonChangeTextHandle), for: .touchUpInside)
        return view
    }()
    
    private lazy var bottomLeftButton: UIButton = {
        let view = UIButton()
        view.setTitle("Change alpha of label", for: .normal)
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
        view.addSubview(changeTextButton)
        view.addSubview(textView)
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
        }
        
        textView.snp.makeConstraints { make in
            let size = textView.sizeThatFits(CGSize(width: view.frame.width,
                                                    height: CGFloat(MAXFLOAT)))
            make.top.equalTo(topCenterLabel.snp.bottom).offset(8)
            make.width.equalTo(view.snp.width)
            make.height.lessThanOrEqualTo(size)
        }
        
        bottomLeftButton.snp.makeConstraints { make in
            make.right.equalTo(belowCenterLabel.snp.right)
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom).offset(-50)
        }
        
        changeTextButton.snp.makeConstraints { make in
            make.right.equalTo(belowCenterLabel.snp.right)
            make.bottom.equalTo(bottomLeftButton.snp.top).offset(-16)
        }
        
        centerLabel.snp.makeConstraints { make in
            make.top.equalTo(aboveCenterLabel.snp.bottom).offset(16)
            make.height.equalTo(120)
            make.width.equalTo(150)
            make.centerX.equalTo(view.snp.centerX)
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
            make.top.equalTo(textView.snp.bottom).offset(16)
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
    
    @objc func buttonChangeTextHandle() {
        textView.text = "​Все разработки компании выполнены согласно стандартами обмена медицинской информацией HL7 CDA, PIX, PDQ, OpenEHR и соответствуют законодательству РФ."
        textView.snp.updateConstraints { make in
            let size = textView.sizeThatFits(CGSize(width: view.frame.width,
                                                    height: CGFloat(MAXFLOAT)))
            make.top.equalTo(topCenterLabel.snp.bottom).offset(8)
            make.width.equalTo(view.snp.width)
            make.height.lessThanOrEqualTo(size)
        }
    }
    
}

