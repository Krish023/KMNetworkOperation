//
//  KMOperationQueueManager.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class KMOperationQueueManager:OperationQueue
{
    
    let completionOperation = BlockOperation {
        // do something
    }
    func addDependencyOperation( to operation1:KMCustomOperation, from  operation:KMCustomOperation)
    {
       operation.addDependency(operation1)
    }
    
    
    func addOperation(operations:[KMCustomOperation],isAdddependency:Bool = false)
    {
        if isAdddependency
        {
            for object in operations {
                let operation = object
                    completionOperation.addDependency(operation)
                self.addOperation(operation)
            }
            self.addOperation(completionOperation)
        }
        else
        {
            self.addOperations(operations, waitUntilFinished: false)
        }
  
    }
    func cancelOperation(operation:KMGetServerDataOperation)
     
    {
        operation.cancel()
    }
    func canceledAllOperation()
    {
        self.cancelAllOperations()
    }
}
