
import UIKit
import PromiseKit
import Alamofire


class Api {
 
    
    class func getAccounts() -> Promise<AccountSet>{
        
        let promise = Promise<AccountSet> { success, fail in
            let url = UrlBuilder.getAccountsUrl()
            
            Alamofire.request(url, method: HTTPMethod.get, parameters: ["":""], encoding: URLEncoding.default, headers: ["":""]).responseJSON { response in
                
                if (response.response?.statusCode)! >= 400 {
                    DispatchQueue.main.async(execute: {
                        fail(NSError(domain: "", code: 2002, userInfo: [NSLocalizedDescriptionKey: "Unable to process request \(url)"]))
                        
                    })
                    return
                }
                
                if response.response?.statusCode == 200 {
                    
                    let json = (try? JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: AnyObject]
                    
                    
                    if let dto = AccountSet().populate(dict: (json as? NSDictionary)!){
                        DispatchQueue.main.async(execute: {
                            success(dto)
                        })
                    }
                    
                } else {
                    DispatchQueue.main.async(execute: {
                        fail(NSError(domain: "radiodrome", code: 2002, userInfo: [NSLocalizedDescriptionKey: "Unable to process request \(url)"]))
                    })
                }
            }
        }
        return promise
    }

   
    
}
