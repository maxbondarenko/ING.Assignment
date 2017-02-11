//
//  AccountsVC.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/10/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit
import Fontello_Swift

class AccountsVC: UIViewController {

    @IBOutlet weak var lvAccounts: UITableView!
    var dsAccounts: AccountSetDTO?
    
    
    func initNavigationController(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.fontIngRegular(size: 16)]
        
        let eyeImage = UIImage.fontEntypoImage(icon: Entypo.Eye, fontSize: 20, color: UIColor.ingOrange())
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: eyeImage, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: self, action: #selector(onBtnEyeTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        initNavigationController()
        
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSetDTO) -> () in
                
                ApiStub().clearStubs()
                
                self.dsAccounts = accounts
                self.lvAccounts.reloadData()
                
            
            }.catch
            { error in
                
                ApiStub().clearStubs()

                
            }
    }
    
    func onBtnEyeTapped(){
        print("tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




extension AccountsVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AccountHeaderCell.getHeight()
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
            var visibleAccounts = AccountDTO.filterVisibleAccounts(dsAccounts?.paymentAccounts ?? [])
            cell.populateCell(account: (visibleAccounts[indexPath.row]))
        }
        else{
            var visibleAccounts = AccountDTO.filterVisibleAccounts(dsAccounts?.savingAccounts ?? [])
            cell.populateCell(account: (visibleAccounts[indexPath.row]))
        }
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            let visibleAccounts = AccountDTO.filterVisibleAccounts(dsAccounts?.paymentAccounts ?? [])
            return visibleAccounts.count
        }
        else{
            let visibleAccounts = AccountDTO.filterVisibleAccounts(dsAccounts?.savingAccounts ?? [])
            return visibleAccounts.count
        }
        
    }
    
}







