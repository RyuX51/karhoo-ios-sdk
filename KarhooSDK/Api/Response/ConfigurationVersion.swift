//
//  ConfigurationVersion.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 09/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

public struct ConfigurationVersion: KarhooCodableModel {

    public let version: String

    init(identifier: String,
         version: String) {
        self.version = version
    }

    enum CodingKeys: String, CodingKey {
        case version
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = (try? container.decode(String.self, forKey: .version)) ?? ""
    }
}
