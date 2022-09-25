//
//  ApiMapper.swift
//  xml
//
//  Created by Kavya on 17/09/22.
//

import Foundation
import SWXMLHash
class ApiMapper: NSObject
{
    
    
    func callGetAPI(apiname:String, parameter:String, completionBlockSuccess successBlock: @escaping ((XMLIndexer) -> Void), andFailureBlock failBlock: @escaping ((AnyObject) -> Void))
    {
        var lobj_Request = URLRequest(url: URL(string: apiname)!)
        let session = URLSession.shared
        var _: NSError?
        
        lobj_Request.httpMethod = "GET"

        
        let task = session.dataTask(with: lobj_Request, completionHandler: {data, response, error -> Void in
            
            let strData = String(data: data!, encoding: .utf8)
            
            
            if error != nil
            {
                print("Error: " + error!.localizedDescription)
            }
            let xml = XMLHash.parse(strData!)
            let xmlString = """
            \(xml["feed"])
            """
            print(xmlString)
        
            let responseXml = XMLHash.parse(xmlString)
            
            
            if let data = response {
                print(data)
                
                if let xmll = response{
                    print("XML: \(xml)")
                    // print(responseXml)
                    DispatchQueue.global(qos: .background).async {
                        DispatchQueue.main.async {
                            successBlock(xml as XMLIndexer)
                        }
                    }
                    
                }
                else
                {
                    let dic = ["message":"Something went wrong, Please try again"]
                    
                    DispatchQueue.global(qos: .background).async {
                        DispatchQueue.main.async {
                            failBlock(dic as AnyObject)
                        }
                    }
                    
                }
            }
                
            else
            {
                let dic = ["message":"Something went wrong, Please try again"]
                
                DispatchQueue.global(qos: .background).async {
                    DispatchQueue.main.async {
                        failBlock(dic as AnyObject)
                    }
                }
                
            }
            
        })
        task.resume()
        
        
    }
    
    
    
}
