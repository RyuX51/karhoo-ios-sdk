//
//  KarhooConfigService.swift
//  KarhooSDK
//
//  
//  Copyright © 2020 Karhoo. All rights reserved.
//

import Foundation

final class KarhooConfigService: ConfigService {

    private let uiConfigInteractor: UIConfigInteractor
    private let configurationInteractor: ConfigurationInteractor
    private let configurationVersionInteractor: ConfigurationVersionInteractor

    init(uiConfigInteractor: UIConfigInteractor = KarhooUIConfigInteractor(),
         configurationInteractor: ConfigurationInteractor = KarhooConfigurationInteractor(),
         configurationVersionInteractor: ConfigurationVersionInteractor = KarhooConfigurationVersionInteractor()) {
        self.uiConfigInteractor = uiConfigInteractor
        self.configurationInteractor = configurationInteractor
        self.configurationVersionInteractor = configurationVersionInteractor
    }

    func uiConfig(uiConfigRequest: UIConfigRequest) -> Call<UIConfig> {
        uiConfigInteractor.set(uiConfigRequest: uiConfigRequest)
        return Call(executable: uiConfigInteractor)
    }

    func configuration(request: ConfigurationRequest) -> Call<Configuration> {
        return Call(executable: configurationInteractor)
    }

    func configurationVersion(request: ConfigurationVersionRequest) -> Call<ConfigurationVersion> {
        return Call(executable: configurationVersionInteractor)
    }
}
