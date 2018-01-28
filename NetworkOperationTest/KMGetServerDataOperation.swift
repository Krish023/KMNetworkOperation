//
//  KMGetServerDataOperation.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class KMGetServerDataOperation: KMCustomOperation {
   
    private let urlString: String
    private let provider: KMNetworkingProvider
    private let postData:Any?
    
    var responseData: Data?
    var statusCode:Int?
    var error:Error?
    var response:URLResponse?
  
  
    init(withURLString urlString: String, data:Any? = nil, andNetworkingProvider provider: KMNetworkingProvider = KMNetworkConnector()){
        self.postData = data
        self.urlString = urlString
        self.provider = provider
    }
    
    
    override func main() {
        guard isCancelled == false
            else
        {
            finish(true)
            return
        }
        executing(true)
       
        provider.restAPICall(urlString: urlString, data: self.postData) { (data,error,statusCode) in
            self.responseData = data
            self.error = error
            self.statusCode = statusCode
            
            self.executing(false)
            self.finish(true)
        }
      
    }
    
    override func start() {
    Thread.detachNewThreadSelector(#selector(self.main), toTarget: self, with: nil)
 
}
}
