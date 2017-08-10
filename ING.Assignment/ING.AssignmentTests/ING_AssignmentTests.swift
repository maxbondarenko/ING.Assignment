

import XCTest
@testable import ING_Assignment

class ING_AssignmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMappingShouldBeCorrect() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let exp = expectation(description: "")
        
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSet) -> () in
                
                ApiStub().clearStubs()
                
                XCTAssert(accounts.accounts.count == 3)
                XCTAssert(accounts.savingAccounts.count == 1)
                XCTAssert(accounts.paymentAccounts.count == 2)
                XCTAssert(accounts.savingAccounts[0].linkedAccount?.iban == "NL23INGB0748757694")
                
                XCTAssert(accounts.accounts[0].currency == AccountCurrency.eur)
                XCTAssert(accounts.accounts[0].balanceInCents == 985000)
                XCTAssert(accounts.accounts[0].getBalanceEuros() == "9850")
                XCTAssert(accounts.accounts[0].getBalanceRemainderCents() == "00")
                XCTAssert(accounts.accounts[0].getCurrencySign() == "€")
                XCTAssert(accounts.accounts[0].iban == "NL23INGB0748757694")
                XCTAssert(accounts.accounts[0].id == 748757694)
                XCTAssert(accounts.accounts[0].isVisible == true)
                XCTAssert(accounts.accounts[0].type == .payment)
                XCTAssert(accounts.accounts[0].linkedAccount == nil)
                XCTAssert(accounts.accounts[0].name == "Hr P L G N StellingTD")
                XCTAssert(accounts.accounts[0].productName == nil)
                XCTAssert(accounts.accounts[0].productType == nil)
                XCTAssert(accounts.accounts[0].savingsTargetReached == nil)
                XCTAssert(accounts.accounts[0].targetAmountInCents == nil)
                
                
                XCTAssert(accounts.accounts[1].currency == AccountCurrency.eur)
                XCTAssert(accounts.accounts[1].balanceInCents == 1000000)
                XCTAssert(accounts.accounts[1].getBalanceEuros() == "10000")
                XCTAssert(accounts.accounts[1].getBalanceRemainderCents() == "00")
                XCTAssert(accounts.accounts[1].getCurrencySign() == "€")
                XCTAssert(accounts.accounts[1].iban == "NL88INGB0748757732")
                XCTAssert(accounts.accounts[1].id == 700000027559)
                XCTAssert(accounts.accounts[1].type == .payment)
                XCTAssert(accounts.accounts[1].isVisible == false)
                XCTAssert(accounts.accounts[1].linkedAccount == nil)
                XCTAssert(accounts.accounts[1].name == ",")
                XCTAssert(accounts.accounts[1].productName == nil)
                XCTAssert(accounts.accounts[1].productType == nil)
                XCTAssert(accounts.accounts[1].savingsTargetReached == nil)
                XCTAssert(accounts.accounts[1].targetAmountInCents == nil)
                
                
                XCTAssert(accounts.accounts[2].type == AccountType.saving)
                XCTAssert(accounts.accounts[2].currency == AccountCurrency.eur)
                XCTAssert(accounts.accounts[2].balanceInCents == 15000)
                XCTAssert(accounts.accounts[2].getBalanceEuros() == "150")
                XCTAssert(accounts.accounts[2].getBalanceRemainderCents() == "00")
                XCTAssert(accounts.accounts[2].getCurrencySign() == "€")
                XCTAssert(accounts.accounts[2].iban == "")
                XCTAssert(accounts.accounts[2].id == 700000027559)
                XCTAssert(accounts.accounts[2].isVisible == true)
                XCTAssert(accounts.accounts[2].linkedAccount != nil)
                XCTAssert(accounts.accounts[2].name == "")
                XCTAssert(accounts.accounts[2].linkedAccountId == 748757694)
                
                XCTAssert(accounts.accounts[2].productName == "Oranje Spaarrekening")
                XCTAssert(accounts.accounts[2].productType == 1000)
                XCTAssert(accounts.accounts[2].savingsTargetReached == true)
                XCTAssert(accounts.accounts[2].targetAmountInCents == 2000)
                
                
                XCTAssert(accounts.returnCode == .ok)
                XCTAssert(accounts.failedAccountTypes == "CREDITCARDS")
                
                exp.fulfill()
                
            }.catch
            { error in
                
                ApiStub().clearStubs()
                XCTAssert(false, "Should be no error")
                exp.fulfill()
                
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "5 second timeout reached")
        })
    }

    func testEuroValueShouldBeCorrect() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let acc = Account()
        acc.currency = .eur
        
        XCTAssert(acc.getCurrencySign() == "€")
    }
    
    func testCentValueShouldBeCorrect() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let acc = Account()
        acc.balanceInCents = 11199
        XCTAssert(acc.getBalanceRemainderCents() == "99")
        XCTAssert(acc.getBalanceEuros() == "111")
    }
    
    func testFilterVisibleAccounts(){
        let exp = expectation(description: "")
        
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSet) -> () in
                
                ApiStub().clearStubs()
                
                let filteredAccounts = Account.filterVisibleAccounts(accounts.accounts)
                
                
                XCTAssert(filteredAccounts.count == 2)
                XCTAssert(filteredAccounts[0].isVisible == true)
                XCTAssert(filteredAccounts[1].isVisible == true)
                
                
                exp.fulfill()
                
            }.catch
            { error in
                
                ApiStub().clearStubs()
                XCTAssert(false, "Should be no error")
                exp.fulfill()
                
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "5 second timeout reached")
        })
    }
    
    func testLinkedAccountShouldExist() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let exp = expectation(description: "")
        
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSet) -> () in
                
                ApiStub().clearStubs()
                
                XCTAssert(accounts.savingAccounts[0].linkedAccount?.iban == "NL23INGB0748757694")
                
                
                exp.fulfill()
                
            }.catch
            { error in
                
                ApiStub().clearStubs()
                XCTAssert(false, "Should be no error")
                exp.fulfill()
                
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "5 second timeout reached")
        })
    }
    
    
}
