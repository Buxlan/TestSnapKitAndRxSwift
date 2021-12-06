//
//  ViewController.swift
//  TestSnapKitAndRxSwift
//
//  Created by  Buxlan on 12/2/21.
//

import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel = MainViewModel()
    
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
        view.backgroundColor = .black
        view.isEditable = false
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
        view.contentEdgeInsets = .init(top: 8, left: 12, bottom: 8, right: 12)
        view.addTarget(self, action: #selector(buttonChangeTextHandle), for: .touchUpInside)
        return view
    }()
    
    private lazy var bottomLeftButton: UIButton = {
        let view = UIButton()
        view.setTitle("Go to Sign in", for: .normal)
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.contentEdgeInsets = .init(top: 8, left: 12, bottom: 8, right: 12)
        view.addTarget(self, action: #selector(buttonTapHandle), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Lifecircle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewModel()
    }

}

// MARK: - Helper methods

extension MainViewController {
    
    private func configureViewModel() {
        
        let _ = viewModel.obserbableText
            .subscribe(onNext: { [weak self] value in
                self?.textView.text = value
                self?.textViewUpdateConstraints()
            })
            .disposed(by: viewModel.disposeBag)
    }
    
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
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom).offset(-50)
        }
        
        changeTextButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
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
        let vc = SignInViewController()
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonChangeTextHandle() {
        let text = "​Все разработки компании выполнены согласно стандартами обмена медицинской информацией HL7 CDA, PIX, PDQ, OpenEHR и соответствуют законодательству РФ."
        viewModel.obserbableText.accept(text)
        textView.snp.updateConstraints { make in
            let size = textView.sizeThatFits(CGSize(width: view.frame.width,
                                                    height: CGFloat(MAXFLOAT)))
            make.top.equalTo(topCenterLabel.snp.bottom).offset(8)
            make.width.equalTo(view.snp.width)
            make.height.lessThanOrEqualTo(size)
        }
    }
    
    private func textViewUpdateConstraints() {
        textView.snp.updateConstraints { make in
            let size = textView.sizeThatFits(CGSize(width: view.frame.width,
                                                    height: CGFloat(MAXFLOAT)))
            make.top.equalTo(topCenterLabel.snp.bottom).offset(8)
            make.width.equalTo(view.snp.width)
            make.height.lessThanOrEqualTo(size)
        }
    }
    
}

