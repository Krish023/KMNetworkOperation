//
//  Data+Swift.swift
//  NetworkOperationTest
//
//  Created by Jha, Krishna on 1/28/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

extension Data {
    
    func toJSON()->Any?
{
    guard
        
        let jsonObject = try? JSONSerialization.jsonObject(with: self, options: [JSONSerialization.ReadingOptions.allowFragments])
    
        else {
            
            return nil
    }
    
    return jsonObject
    }
}
