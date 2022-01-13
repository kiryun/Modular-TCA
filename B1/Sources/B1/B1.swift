import Effects
import ComposableArchitecture
import B2

public struct B1State: Equatable{
    public init(){}
    
    public var loginData: String = ""
    var resultString: String = ""
    
    var b2State = B2State(resultString: "")
}

public enum B1Action{
    case onAppear
    case dataLoaded(Result<String, ApiError>)
    
    case b2Action(B2Action)
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
>.combine(
    b2Reducer.pullback(
        state: \.b2State,
        action: /B1Action.b2Action,
        environment: { _ in
                .init(
                    request: EffectsImpl().numbersApiFour,
                    mainQueue: {.main})
        }),
    Reducer{ state, action, environment in
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
        default:
            return .none
        }
    }
)








