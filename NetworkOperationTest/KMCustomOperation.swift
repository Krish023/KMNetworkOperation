//
//  KMNetworkOperarion.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class KMCustomOperation: Operation {
    
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    
    override var isFinished: Bool {
        return _finished
    }
    
 
    func executing(_ executing: Bool) {
        _executing = executing
    }

    func finish(_ finished: Bool) {
        _finished = finished
    }
    
override var isConcurrent: Bool {
    return true
    //Default is NO so overriding it to return YES;
}
override var isAsynchronous: Bool
    {
    return true
    }
}
