import Effects
import ComposableArchitecture

public struct A1State: Equatable{
    public init(){}
    var resultString: String = ""
}

public enum A1Action: Equatable{
    case onAppear
    case dataLoaded(Result<String, ApiError>)
}

public struct A1Environment{
    
    public init(
        request: () -> Effect<String, ApiError>,
        mainQueue: () -> AnySchedulerOf<DispatchQueue>
    ){}
    
    var request: () -> Effect<String, ApiError> = {
        let effects: Effects = EffectsImpl()
        return effects.numbersApiOne()
    }
    
    var mainQueue: () -> AnySchedulerOf<DispatchQueue> = {
        .main
    }
}

public let a1Reducer = Reducer<
    A1State,
    A1Action,
    A1Environment
>{ state, action, environment in
    switch action{
    case .onAppear:
        return environment.request()
            .receive(on: environment.mainQueue())
            .catchToEffect()
            .map(A1Action.dataLoaded)
    case .dataLoaded(let result):
        switch result{
        case .success(let result):
            state.resultString = result
        case .failure(let error):
            break
        }
        return .none
    }
}

func dummyA1Effect() -> Effect<String, ApiError>{
    let dummyString = "test"
    return Effect(value: dummyString)
}
