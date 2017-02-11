
import UIKit

class DateFormatterSingleton{
    
    static let posixDateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        d.dateFormat =   "yyyy-MM-dd'T'HH:mm:ss"
        return d
    }()
    
    static let dateTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "dd-MM-yyyy"
        return d
    }()
    
    static let dateTimeTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "dd-MM-yyyy HH:mm"
        return d
        
        
    }()
    
    static let humanDateTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateStyle = .medium
        
        
        
        
        
        d.doesRelativeDateFormatting = true
        return d
    }()
    
    static let timeTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "HH:mm"
        return d
    }()
    
    static let monthTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "MMMM"
        return d
    }()
    
    static let dayTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "dd"
        return d
    }()
    
    static let dayAndMonthTitleFormatter: DateFormatter = {
        let d = DateFormatter()
        d.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        d.timeZone = NSTimeZone.local
        d.dateFormat = "dd MMMM"
        return d
    }()
    
}

extension NSDate {
    
    
    
    class func dateFromPosixDateString(s: String) ->
        Date {
        let dateFormatter = DateFormatterSingleton.posixDateFormatter
        let shortDate = s.substring(toIndex: 19)
        let res = dateFormatter.date(from: shortDate)
        return res!
    }
    
    
    func getDateTitle() -> String{
        return DateFormatterSingleton.dateTitleFormatter.string(from: self as Date)
    }
    
    func getDateTimeTitle() -> String{
        return DateFormatterSingleton.dateTimeTitleFormatter.string(from: self as Date)
    }
    
    //formatted like Today/Yesterday etc
    func getHumanDateTitle() -> String{
        return DateFormatterSingleton.humanDateTitleFormatter.string(from: self as Date)
    }
    
    func getTimeTitle() -> String{
        return DateFormatterSingleton.timeTitleFormatter.string(from: self as Date)
    }
    
    func getMonthTitle() -> String{
        return DateFormatterSingleton.monthTitleFormatter.string(from: self as Date)
    }
    
    func getDayTitle() -> String{
        return DateFormatterSingleton.monthTitleFormatter.string(from: self as Date)
    }
    
    func getDayAndMonthTitle() -> String{
        return DateFormatterSingleton.dayAndMonthTitleFormatter.string(from: self as Date)
    }
}
