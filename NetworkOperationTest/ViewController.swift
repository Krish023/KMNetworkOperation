//
//  ViewController.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        let op =  KMGetServerDataOperation.init(withURLString: "https://www.google.com/")
        op.name = "1"
        let op1 =  KMGetServerDataOperation.init(withURLString: "https://www.google.com/")
         op.name = "2"
        let op2 =  KMGetServerDataOperation.init(withURLString: "https://www.google.com/")
         op.name = "3"
        let queue =   KMOperationQueueManager()
        queue.addOperation(operations: [op,op1,op2],isAdddependency:true)
       // queue.maxConcurrentOperationCount = 2
        op.completionBlock = {
            KMLogger.log(message: op.responseData ?? "")
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

