//
//  ViewController.swift
//  xmlParse
//
//  Created by Kavya on 17/09/22.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
        // Do any additional setup after loading the view.
    }

    func apiCall(){
    
        let api = "https://services.odata.org/V3/Northwind/Northwind.svc/Customers"
//        let terminalID = Constant.sharedInstance().terminalID
//        let password = Constant.sharedInstance().password
//        var prodCode = ""
//        recNo = recNo+1
//        refNo = refNo+1
//
//        let kUserDefault = UserDefaults.standard
//        kUserDefault.set(recNo, forKey: "recNo")
//        kUserDefault.set(refNo, forKey: "refNo")
       // kUserDefault.synchronize()
//
//        switch slectedCategory {
//        case "Etisalat Recharge":
//            prodCode = "ETSTOP"
//            break
//        case "DU Recharge":
//            prodCode = "DUTB2C"
//            break
//        case "Salik Recharge":
//            prodCode = "TSTSLK"
//            break
//        case "iTunes Recharge":
//            prodCode = "TESTIT"
//            break
//        default:
//            print("default")
//        }
        
        
//        let para = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:tem=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><tem:Process><tem:RequestXml><![CDATA[ <RequestXml><Type>PinRequest</Type><TerminalId>\(terminalID)</TerminalId><Password>\(password)</Password><ReceiptNo>\(recNo!)</ReceiptNo><ValueCode>\(amount!)</ValueCode><RefNo>\(refNo!)</RefNo><ProdCode>\(prodCode)</ProdCode><Language>eng</Language></RequestXml>]]></tem:RequestXml></tem:Process></soapenv:Body></soapenv:Envelope>"
        
        ApiMapper().callGetAPI(apiname: api, parameter: "", completionBlockSuccess: {
            
            
            (response) in
            print(response)
            do {
                let feed: Model = try response.value()
                print(feed.feed)
            } catch  {
                print(error)
            }
            
           
            
        }, andFailureBlock: { (response) in
            print(response)
        })
        
    }

}

