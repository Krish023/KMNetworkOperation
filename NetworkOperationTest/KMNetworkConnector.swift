//
//  KMNetworkConnector.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class KMNetworkConnector: KMNetworkingProvider
{
    
    func restAPICall(urlString: String?,data:Any? = nil, onCompleted: @escaping ((Data?, Error?, Int?) -> ())) {
        
        guard  urlString != nil  else {
            onCompleted(nil,nil,nil)
                return
        }
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self as? URLSessionDelegate, delegateQueue: .main)
        
       // let sessionConfig = URLSessionConfiguration.default
        let request = URLRequest(url:(urlString?.asURL())!)
        if data != nil
        {
            //request.httpBody = 
        }
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                // Success
                var code = -1
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully . Status code: \(statusCode)")
                    code = statusCode
                }
                onCompleted(data,error,code)
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription as Any);
                  onCompleted(data,error,-1)
                
            }
        }
        task.resume()
      
       
    }
    

    // URLSessionDataDelegate methods
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        // got some data
    }
    
    // URLSessionTaskDelegate methods
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        // task finished
    }
}
