// SPDX-License-Identifier: MIT
// Copyright © 2018-2021 WireGuard LLC. All Rights Reserved.

import Intents

class IntentHandler: INExtension {

    override init() {
        super.init()
        Logger.configureGlobal(tagged: "INTENTS", withFilePath: FileManager.logFileURL?.path)
    }

    override func handler(for intent: INIntent) -> Any {
        guard intent is GetPeersIntent || intent is UpdateConfigurationIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }

        return IntentHandling()
    }

}
