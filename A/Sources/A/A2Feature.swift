//
//  A2Feature.swift
//  
//
//  Created by Wimes on 2022/01/12.
//

import Effects
import ComposableArchitecture

public struct A2State: Equatable{
    var resultString: String
}

public enum A2Action: Equatable{
    case onAppear
    case dataLoaded(Result<String, ApiError>)
}

public struct A2Environment{
    var request: () -> Effect<String, ApiError>
    var mainQueue: () -> AnySchedulerOf<DispatchQueue>
    
    public init(
        request: @escaping () -> Effect<String, ApiError>,
        mainQueue: @escaping () -> AnySchedulerOf<DispatchQueue>
    ){
        self.request = request
        self.mainQueue = mainQueue
    }
}

public let a2Reducer = Reducer<
    A2State,
    A2Action,
    A2Environment
>{ state, action, environment in
    switch action{
    case .onAppear:
        return environment.request()
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map(A2Action.dataLoaded)
    case .dataLoaded(.success(let result)):
        state.resultString = result
        return .none
    case .dataLoaded(.failure(let error)):
        return .none
    }
}


