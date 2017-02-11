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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let font = UIFont.fontIngBold(size: 20)
        
        
        let eyeImage = UIImage.fontEntypoImage(icon: Entypo.Eye, fontSize: 20, color: UIColor.ingOrange())
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: eyeImage, landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: self, action: #selector(onBtnEyeTapped))
        
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
        return 0
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
            let cell:AccountCell = self.lvAccounts.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
            
            cell.populateCell(account: (self.dsAccounts?.accounts[indexPath.row])!)
        
            return cell
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dsAccounts?.accounts.count ?? 0
        
    }
    
}







