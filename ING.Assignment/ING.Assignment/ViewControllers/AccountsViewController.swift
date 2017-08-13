

import UIKit
import Fontello_Swift

import RxSwift
import RxCocoa
import RxDataSources

class AccountsViewController: UIViewController {

    var viewModel = AccountsViewModel()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var lvAccounts: UITableView!
    var dsAccounts: AccountSet?

    
    var editMode = false{
        didSet{
            if(editMode){
                self.navigationItem.rightBarButtonItem?.image = nil
                self.navigationItem.rightBarButtonItem?.title = "Done"
                self.navigationItem.rightBarButtonItem?.tintColor = UIColor.ingOrange()
            }
            else{
                
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: self.eyeImage, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: self, action: #selector(onBtnEyeTapped))
                
            }
            
            lvAccounts.reloadData()
        }
    }

    let eyeImage = UIImage.fontEntypoImage(icon: Entypo.Eye, fontSize: 20, color: UIColor.ingOrange())
    
    
    func bindViewModel(){
        self.viewModel.editMode.asObservable().subscribe(){el in
            self.editMode = el.element ?? false
        }
        
        
        /*self.viewModel.accountSet.asObservable().map{el -> [Account] in
                return (el.accounts)
            }
            .bind(to: self.lvAccounts.rx.items(cellIdentifier: "AccountCell", cellType: AccountCell.self)){(row, account, cell) in
       
                  cell.populateCell(account: account, editMode: self.editMode)
            
            }
            .addDisposableTo(self.disposeBag)
        
        */
        
        
        //=====
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Account>>()
        
        let items = viewModel.tableViewItems
        dataSource.titleForHeaderInSection = {(el, sectionNum) -> String in
            return ["Payment accounts","Saving accounts"][sectionNum]

        }
        
        
        dataSource.configureCell =
            
            { (dataSource, tableView, indexPath, account) in
            
                let cell = (tableView.dequeueReusableCell(withIdentifier: "AccountCell"))
                let accountCell = cell as? AccountCell
            
                
                accountCell?.populateCell(account: account, editMode: self.editMode)
                return accountCell!
            }
        
        items.asObservable()
            .bind(to: self.lvAccounts.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
    }
    
    func initNavigationController(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.fontIngRegular(size: 16)]
        
        
 
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: self.eyeImage, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: self, action: #selector(onBtnEyeTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        bindViewModel()
        
        
        initNavigationController()
        
        ApiStub().stubGetAccounts()
        Api.getAccounts().subscribe{ result in
            
            ApiStub().clearStubs()
            
            if(result.error != nil){
                //handle error and return
                return
            }
            if let accouts = result.element{
               self.viewModel.accountSet.value = accouts
            }
            
        
        }.disposed(by: self.disposeBag)
            
        
            
            
            
        
    }
    
    
    func onBtnEyeTapped(){
        self.editMode = !self.editMode
        self.viewModel.editMode.value = self.editMode
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




/*extension AccountsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
   /* func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AccountHeaderCell.getHeight()
    }
    */
    
    
   /* func numberOfSections(in tableView: UITableView) -> Int {
        return AccountType.casesCount()
    }
    */
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
    
    
  /*  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AccountCell = self.lvAccounts.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        
        if(indexPath.section == 0){
            var accountsToDisplay = dsAccounts?.paymentAccounts ?? []
            if(!editMode){
                accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            }
            cell.populateCell(account: (accountsToDisplay[indexPath.row]),editMode: self.editMode)
        }
        else{
            var accountsToDisplay = dsAccounts?.savingAccounts ?? []
            if(!editMode){
                accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            }
            
            cell.populateCell(account: (accountsToDisplay[indexPath.row]),editMode: self.editMode)
        }
        
        return cell
    }
    */
    
    
    
   /* func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            var accountsToDisplay = dsAccounts?.paymentAccounts ?? []
            if(!editMode){
                accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            }
            return accountsToDisplay.count
        }
        else{
            var accountsToDisplay = dsAccounts?.savingAccounts ?? []
            if(!editMode){
                accountsToDisplay = Account.filterVisibleAccounts(accountsToDisplay)
            }
            
            return accountsToDisplay.count
        }
        
    }
 */
    
}*/








