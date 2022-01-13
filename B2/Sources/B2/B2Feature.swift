import Effects
import ComposableArchitecture

public struct B2State: Equatable{
    var resultString: String
    
    public init(
        resultString: String
    ){
        self.resultString = resultString
    }
}

public enum B2Action{
//    case receiveOpenView
    case onAppear
    case dataLoaded(Result<String, ApiError>)
}

public struct B2Environment{
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

public let b2Reducer = Reducer<
    B2State,
    B2Action,
    B2Environment
>{ state, action, environment in
    switch action{
//    case .receiveOpenView:
//        return .none
    case .onAppear:
        print("### real B2 onAppear")
        return environment.request()
            .receive(on: environment.mainQueue())
            .catchToEffect(B2Action.dataLoaded)
        
    case .dataLoaded(.success(let result)):
        state.resultString = result
        return .none
    case .dataLoaded(.failure(let error)):
        return .none
    }
}
