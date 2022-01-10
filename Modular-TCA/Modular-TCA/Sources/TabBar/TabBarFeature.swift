//
//  TabBarFeature.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import ComposableArchitecture
import Effects
import A1


struct TabBarState: Equatable{
    var loginData: String
    var a1State = A1State()
}

enum TabBarAction{
    case a1Action(A1Action)
}

struct TabBarEnvironmnet{}

let tabBarReducer = Reducer<
    TabBarState,
    TabBarAction,
    TabBarEnvironmnet
>.combine(
    a1Reducer.pullback(
        state: \.a1State,
        action: /TabBarAction.a1Action,
        environment: { _ in
                .init(
                    request: EffectsImpl().numbersApiOne,
                    mainQueue: {.main}
                )
        })
    
)
