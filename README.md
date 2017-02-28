Assignment:
 
1. Create an universal iOS App that shows a list of accounts.
2. There are two versions of this list that is displayed: complete list and the list of only visible accounts. How you choose to display/switch between these two versions is entirely your own. You can use the existing Bankieren app for inspiration.
3. You also want to be able to show this list in a different target like Apple Watch/Today's Widget
4. Don’t forget your UI and Unit-tests

Use the data from the datasource below:
 
Datasource:
{
    accounts =     (
                {
            accountBalanceInCents = 985000;
            accountCurrency = EUR;
            accountId = 748757694;
            accountName = "Hr P L G N StellingTD";
            accountNumber = 748757694;
            accountType = PAYMENT;
            alias = “”;
    isVisible = true;
            iban = NL23INGB0748757694;
        },
        {
            accountBalanceInCents = 1000000;
            accountCurrency = EUR;
            accountId = 700000027559;
            accountName = ",";
            accountNumber = 748757732;
            accountType = PAYMENT;
            alias = “";
    isVisible = false;
            iban = NL88INGB0748757732;
        },
        {      
            accountBalanceInCents = 15000;
            accountCurrency = EUR;
            accountId = 700000027559;
            accountName = "";
            accountNumber = "H 177-27066";
            accountType = SAVING;
            alias = "G\UfffdLSAVINGSdiacrits";
            iban = “";
    isVisible = true;
            linkedAccountId = 748757694;
            productName = "Oranje Spaarrekening";
            productType = 1000;
            savingsTargetReached = 1;
            targetAmountInCents = 2000;
        }
    );
    failedAccountTypes = “CREDITCARDS";
    returnCode = OK;
}
 
If you have any questions please first try to make assumptions and proceed.
We want to see you implement it in a way that you see best fit.
There are no right or wrong answers.
 
If you still have questions please feel free to drop a message.
 
Happy coding! 
