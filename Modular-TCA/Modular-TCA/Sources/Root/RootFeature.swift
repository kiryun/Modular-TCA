//
//  RootFeature.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import ComposableArchitecture

enum RootState: Equatable{
    case login(LoginState)
    case tabBar(TabBarState)
    
    public init() { self = .login(.init())}
}


enum RootAction{
    case loginAction(LoginAction)
    case tabBarAction(TabBarAction)
}

struct RootEnvironment{}

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(
    loginReducer.pullback(
        state: /RootState.login,
        action: /RootAction.loginAction,
        environment: {_ in LoginEnvironmnet()}
    ),
    tabBarReducer.pullback(
        state: /RootState.tabBar,
        action: /RootAction.tabBarAction,
        environment: {_ in TabBarEnvironmnet()}
    ),
    Reducer{ state, action, _ in
        switch action {
        case .loginAction(.logIn(.success(let response))):
            state = .tabBar(.init(loginData: response))
            return .none
        case .loginAction:
            return .none
        case .tabBarAction:
            return .none
        }
    }
)
