
import Foundation

public class UrlBuilder: NSObject {
   
    //Not really smth necessary in the assignment but usually you get json from web so 
    //should be good to include it from the very beginning
    //For not the response will be replaced by JsonStubs
    
    public class func getAccountsUrl() -> String{
        return getBaseUrl() + "something/for/the/future"
    }
    
    public class func getBaseUrl() -> String {
        return "https://api.ing.com"
    }
    

    
    
}
