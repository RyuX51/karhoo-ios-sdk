//
//  Configuration.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 09/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

public struct Configuration: KarhooCodableModel {

    public let identifier: String
    public let version: String
    public let data: Data

    init(identifier: String,
         version: String,
         data: Data) {
        self.identifier = identifier
        self.version = version
        self.data = data
    }

    enum CodingKeys: String, CodingKey {
        case identifier
        case version
        case data = "flags"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = (try? container.decode(String.self, forKey: .identifier)) ?? ""
        self.version = (try? container.decode(String.self, forKey: .version)) ?? ""
        self.data = (try? container.decode(Data.self, forKey: .data)) ?? Data()
    }
}
