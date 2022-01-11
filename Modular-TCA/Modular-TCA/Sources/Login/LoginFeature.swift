//
//  LoginFeature.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import Foundation
import ComposableArchitecture

struct LoginState: Equatable{
    var logInResponse: String = ""
}

enum LoginAction{
    case onAppear
    case logIn(Result<String, Never>)
}

struct LoginEnvironmnet{}

let loginReducer = Reducer<
    LoginState,
    LoginAction,
    LoginEnvironmnet
>{ state, action, envrionment in
    switch action{
    case .onAppear:
        return .none
    case .logIn(.success(let response)):
        state.logInResponse = response
//        print("### ", state.logInResponse)
        return .none
    }
    
}
