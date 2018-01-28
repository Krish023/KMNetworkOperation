//
//  KMNetworkingProvider.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/26/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit

protocol KMNetworkingProvider {
     func restAPICall(urlString: String?, onCompleted:@escaping  ((Data?,Error?,Int?) -> ()))

}
