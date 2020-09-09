//
//  ConfigurationRequest.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 09/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

public struct ConfigurationRequest {

    public var identifier: String
    public var platform: String = "iOS"
    public var version: String

    public init(identifier: String,
                platform: String = "iOS",
                version: String) {
        self.identifier = identifier
        self.platform = platform
        self.version = version
    }
}
