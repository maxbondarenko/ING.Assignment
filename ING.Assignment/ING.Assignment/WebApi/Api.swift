
import UIKit
import PromiseKit
import Alamofire
import RxCocoa
import RxSwift
import RxAlamofire



public enum ApiError: Swift.Error
{
    case unknown
}

class Api {
 
    let disposeBag = DisposeBag()
    
    class func getAccounts() -> Observable<AccountSet>{
        
        let url = UrlBuilder.getAccountsUrl()
        
        let result = RxAlamofire.requestJSON(.get, url)
            //.debug()
            .map{ (resp, json) -> AccountSet in
                
                if let dto = AccountSet().populate(dict: (json as? NSDictionary)!){
                   return dto
                }
                throw ApiError.unknown
            }
        
        return result
    }
    
    
  
    
}
