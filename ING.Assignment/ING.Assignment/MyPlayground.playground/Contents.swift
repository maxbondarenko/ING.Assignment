//: Playground - noun: a place where people can play

import UIKit
import RxCocoa
import RxSwift

let o = Observable.of(1)

class Puuuu{
    let prop = Variable<Int>.init(0)
    let denendency = Variable<Int>.init(0)
    init(){
        prop.asObservable().subscribe{el in
            print("PUUUUUUU!" )
            print(el.element)
            self.denendency.value = el.element!
        }
    }
}



let pu = Puuuu()

pu.prop.value = 102


pu.prop.value
pu.denendency.value


let ten = Variable.init(10)
let tweny = Variable.init(20)

//ten.asObservable().bind(to: tweny)
tweny.asObservable().subscribe(){el in
    ten.value = el.element!
}
print(ten.value)
print(tweny.value)
tweny.value = 3444

print(ten.value)
print(tweny.value)

tweny.value = 555

print(ten.value)
print(tweny.value)


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
pu.prop.value = 1022222
