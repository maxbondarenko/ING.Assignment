

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lvAccounts: UITableView!
    var dsAccounts: AccountSet?
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        loadData()
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
        return UIEdgeInsets.zero
    }
    
    

    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if activeDisplayMode == .expanded {
  
            lvAccounts.reloadData()
            preferredContentSize = CGSize(width: maxSize.width, height: lvAccounts.contentSize.height)
        }
        else if activeDisplayMode == .compact {
       
            lvAccounts.reloadData()
            preferredContentSize = CGSize(width: maxSize.width, height: maxSize.height)
            //preferredContentSize = maxSize
        }
    }

    

    func loadData(){
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSet) -> () in
                
                ApiStub().clearStubs()
                
                self.dsAccounts = accounts
                self.lvAccounts.reloadData()
                
                //self.updatePreferredContentSize()
                //self.resizeWidget()
            }.catch
            { error in
                
                ApiStub().clearStubs()
                //TODO: Implement some error handling
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        //self.preferredContentSize = CGSize(width: self.preferredContentSize.width, height: 500)
        if #available(iOSApplicationExtension 10.0, *) {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        self.preferredContentSize.height = 200
        
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AccountHeaderCell.getHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AccountType.casesCount()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var title = ""
        if(section == 0){
            title = AccountType.payment.getGroupTitle()
        }
        else{
            title = AccountType.saving.getGroupTitle()
        }
        
        let cell:AccountHeaderCell = self.lvAccounts.dequeueReusableCell(withIdentifier: "AccountHeaderCell") as! AccountHeaderCell
        cell.populateCell(title: title)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell:AccountCell = self.lvAccounts.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        
        if(indexPath.section == 0){
            var accountsToDisplay = dsAccounts?.paymentAccounts ?? []
         
            accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            
            cell.populateCell(account: (accountsToDisplay[indexPath.row]),editMode: false)
        }
        else{
            var accountsToDisplay = dsAccounts?.savingAccounts ?? []
            
            accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            
            cell.populateCell(account: (accountsToDisplay[indexPath.row]),editMode: false)
        }
        
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            var accountsToDisplay = dsAccounts?.paymentAccounts ?? []
            
            accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            
            return accountsToDisplay.count
        }
        else{
            var accountsToDisplay = dsAccounts?.savingAccounts ?? []
            accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            
            
            return accountsToDisplay.count
        }
        
    }
    
}
