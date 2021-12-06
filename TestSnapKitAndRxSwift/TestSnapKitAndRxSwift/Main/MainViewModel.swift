//
//  ViewModel.swift
//  TestSnapKitAndRxSwift
//
//  Created by  Buxlan on 12/4/21.
//

import RxSwift
import RxRelay

class MainViewModel {
    
    var textChangedRelay: (String) -> Void = { _ in }
    
    let text = "Флагманское телемедицинское решение компании является крупнейшим в стране по количеству подключенных пользователей. Его используют ДЗМ г. Москвы, «Доктор рядом», ГК «Эксперт», «Лечебный центр», ФНКЦ ФМБА России и другие медицинские организации."
    var obserbableText: BehaviorRelay<String>
//    var subscriber: Disposable
    var disposeBag = DisposeBag()
    
    init() {
        obserbableText = BehaviorRelay<String>(value: text)
    }
    
    func changeText(newValue: String) {
        obserbableText.accept(newValue)
    }
    
}
