//
//  Modular_TCAApp.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import ComposableArchitecture

@main
struct Modular_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: RootState(),
                    reducer: rootReducer,
                    environment: RootEnvironmnet()
                )
            )
        }
    }
}
