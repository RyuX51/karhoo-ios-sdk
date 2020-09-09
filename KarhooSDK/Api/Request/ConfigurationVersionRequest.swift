//
//  ConfigurationVersionRequest.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 10/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

public struct ConfigurationVersionRequest {

    public var identifier: String
    public var platform: String = "iOS"

    public init(identifier: String,
                platform: String = "iOS") {
        self.identifier = identifier
        self.platform = platform
    }
}
