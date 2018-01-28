//
//  KMGetServerDataOperation.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class KMGetServerDataOperation: KMCustomOperation {
    typealias onCompletioBlock = (Data?,Error?,Int?)-> ()
    private let urlString: String
    private let provider: KMNetworkingProvider
    var responseData: Data?
    var statusCode:Int?
    var error:Error?
    var response:URLResponse?
    var completionHanlder:onCompletioBlock?
  
    init(withURLString urlString: String, andNetworkingProvider provider: KMNetworkingProvider = KMNetworkConnector()){
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
       
        provider.restAPICall(urlString: urlString) { (data,error,statusCode) in
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
