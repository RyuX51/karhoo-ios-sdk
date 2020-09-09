//
//  ConfigurationVersionInteractor.swift
//  KarhooSDK
//
//  Created by Jeevan Thandi on 10/09/2020.
//  Copyright © 2020 Flit Technologies Ltd. All rights reserved.
//

import Foundation

protocol ConfigurationVersionInteractor: KarhooExecutable {
    func set(request: ConfigurationVersionRequest)
}

final class KarhooConfigurationVersionInteractor: ConfigurationVersionInteractor {

    private let requestSender: RequestSender
    private var request: ConfigurationVersionRequest?

    init(requestSender: RequestSender = KarhooRequestSender(httpClient: TokenRefreshingHttpClient.shared)) {
        self.requestSender = requestSender
    }

    func execute<T: KarhooCodableModel>(callback: @escaping CallbackClosure<T>) {
        guard let request = self.request else {
            return
        }
        requestSender.requestAndDecode(payload: nil,
                                       endpoint: .latestFlags(identifier: request.identifier,
                                                              platform: request.platform),
                                       callback: callback)
    }

    func cancel() {
        requestSender.cancelNetworkRequest()
    }

    func set(request: ConfigurationVersionRequest) {
        self.request = request
    }
}
