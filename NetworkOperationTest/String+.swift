//
//  String+.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 12/19/17.
//  Copyright © 2017 Jha, Krishna. All rights reserved.
//

import Foundation


extension String {

    func asURL()->URL?
    {
        return URL.init(string:self)
    }
    var localized: String! {
        let localizedString = NSLocalizedString(self, comment: "")
        return localizedString
    }

}
