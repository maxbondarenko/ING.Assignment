//: Playground - noun: a place where people can play

import UIKit
import RxCocoa
import RxSwift



Observable.of(1,2,3)
    .subscribe{e in
        
       print(e)
    }
    .addDisposableTo(DisposeBag())


var str = Variable<Bool>.init(true)
str.asObservable().subscribe{
    print($0)
}
str.value = false
str.value = true