

import UIKit
import OHHTTPStubs


class ApiStub: NSObject {

    
    class func getIsJsonStubEnabled()->Bool{
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let myDict = NSDictionary(contentsOfFile: path)
            let value = myDict?.value(forKey: "JsonStubEnabled") as? Bool
            return value ?? false
        }
        return false
    }
    
    
    func stub(filename: String){
    
        OHHTTPStubs.removeAllStubs()
        
        //Here we stub the Http response so the service wont have to load data from internet
        _ = OHHTTPStubs.stubRequests(passingTest: { (request: URLRequest) -> Bool in
            return true
        }, withStubResponse: { (req: URLRequest) -> OHHTTPStubsResponse in
            
            let fixture = OHPathForFile(filename, type(of: self) as AnyClass)

            
            return OHHTTPStubsResponse(fileAtPath: fixture!,
                                       statusCode: 200, headers: ["Content-Type":"application/json"])
            
        })
        
    }
    
   
    
    func stubGetAccounts(){
        ApiStub().stub(filename: "GetAccountsSuccess.json")
    }
    
     func clearStubs(){
        OHHTTPStubs.removeAllStubs()
    }
}
