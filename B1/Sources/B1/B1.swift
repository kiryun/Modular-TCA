import Effects
import ComposableArchitecture

public struct B1State: Equatable{
    public init(){}
//    public init(loginData: String){self.loginData = loginData}
    
    public var loginData: String = ""
    var resultString: String = ""
}

public enum B1Action{
    case onAppear
    case dataLoaded(Result<String, ApiError>)
    case openTheNextView
}

public struct B1Environment{
    var request: () -> Effect<String, ApiError> = {
        let effects: Effects = EffectsImpl()
        return effects.numbersApiTwo()
    }
    
    var mainQueue: () -> AnySchedulerOf<DispatchQueue> = {.main}

    public init(){}
    
    // var dev = {}
}

public let b1Reducer = Reducer<
    B1State,
    B1Action,
    B1Environment
>{ state, action, environment in
    
    switch action{
    case .onAppear:
        return environment.request()
            .receive(on: environment.mainQueue())
            .catchToEffect(B1Action.dataLoaded)
    case .dataLoaded(.success(let result)):
        state.resultString = result
        return .none
    case .dataLoaded(.failure(let error)):
        return .none
    case .openTheNextView:
        return .none
    }
}








