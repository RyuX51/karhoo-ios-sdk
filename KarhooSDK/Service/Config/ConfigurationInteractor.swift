//
//  ConfigurationInteractor.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 09/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

protocol ConfigurationInteractor: KarhooExecutable {
    func set(request: ConfigurationRequest)
}

final class KarhooConfigurationInteractor: ConfigurationInteractor {

    private let requestSender: RequestSender
    private var request: ConfigurationRequest?

    init(requestSender: RequestSender = KarhooRequestSender(httpClient: TokenRefreshingHttpClient.shared)) {
        self.requestSender = requestSender
    }

    func execute<T: KarhooCodableModel>(callback: @escaping CallbackClosure<T>) {
        guard let request = self.request else {
            return
        }
        requestSender.requestAndDecode(payload: nil,
                                       endpoint: .flags(identifier: request.identifier,
                                                        version: request.version,
                                                        platform: request.platform),
                                       callback: callback)
    }

    func cancel() {
        requestSender.cancelNetworkRequest()
    }

    func set(request: ConfigurationRequest) {
        self.request = request
    }
}

