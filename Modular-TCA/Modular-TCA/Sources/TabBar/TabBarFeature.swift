//
//  TabBarFeature.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import ComposableArchitecture
import Effects
import A
import B1


struct TabBarState: Equatable{
    var loginData: String
    
    var a1State = A1State()
    var b1State = B1State()
}

enum TabBarAction{
    case a1Action(A1Action)
    case b1Action(B1Action)
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
                .init()
        }),
    b1Reducer.pullback(
        state: \.b1State,
        action: /TabBarAction.b1Action,
        environment: { _ in
                .init(
                    request: {EffectsImpl().numbersApiTwo()},
                    mainQueue: {.main}
                )
        }),
    Reducer{state, action, _ in
        switch action{
        case .b1Action(.onAppear):
            state.b1State.loginData = state.loginData
            return .none
        default:
//            return Effect<TabBarAction, Never>(value: .b2Action(.onAppear))
            return .none
        }
    }
)
