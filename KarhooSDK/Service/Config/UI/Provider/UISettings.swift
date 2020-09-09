//
//  UISettings.swift
//  KarhooSDK
//
//  
//  Copyright © 2020 Karhoo. All rights reserved.
//

import Foundation

struct UISettings {

    static var settings: [String: [String: UIConfig]] = [Keys.karhooUserOrg:
                                                            ["additionalFeedbackButton": UIConfig(hidden: false)]]
}
