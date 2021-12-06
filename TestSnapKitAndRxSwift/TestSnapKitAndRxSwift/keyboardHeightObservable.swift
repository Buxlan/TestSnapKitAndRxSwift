//
//  keyboardHeightObservable.swift
//  TestSnapKitAndRxSwift
//
//  Created by  Buxlan on 12/5/21.
//

import RxSwift
import RxCocoa
typealias KeyboardHeightInfo = (CGFloat, TimeInterval)

func keyboardHeight() -> Driver<KeyboardHeightInfo> {
  return Observable
    .from([
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .map { notification -> KeyboardHeightInfo in
                let userInfo = notification.userInfo
                let value = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
                return (value, animationDuration)
            },
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .map { notification -> KeyboardHeightInfo in
                let userInfo = notification.userInfo
                let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
                return (0, animationDuration)
            }
      ])
    .merge()
    .asDriver(onErrorDriveWith: Driver.never())
}

// code to insert in view controller
// changing constraint of table view when keyboard is showing/hiding

//keyboardHeight()
//    .drive(onNext: { [unowned self] (value, animationDuration) in
//        self.resultTableViewBottomConstraint.constant = value
//        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
//            self.view.layoutIfNeeded()
//        })
//    })
//}
