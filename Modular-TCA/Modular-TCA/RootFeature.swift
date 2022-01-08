//
//  RootFeature.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import ComposableArchitecture
import Effects
import A1


struct RootState{
    var a1State = A1State()
}

enum RootAction{
    case a1Action(A1Action)
}

struct RootEnvironmnet{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironmnet
>.combine(
    a1Reducer.pullback(
        state: \.a1State,
        action: /RootAction.a1Action,
        environment: { _ in
                .init(
                    request: EffectsImpl().numbersApiOne,
                    mainQueue: {.main}
                )
        })
    
)

