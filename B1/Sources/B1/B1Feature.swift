import Effects
import ComposableArchitecture
import B2

public struct B1State: Equatable{
    public var loginData: String = ""
    public var resultString: String = ""
    public var b2State = B2State(resultString: "")
    
    // 외부로 접근이 제한된 변수가 필요하다면 private으로 선언
//    private internalData: String = ""
    public init(){}
}

public enum B1Action{
    case onAppear
    case dataLoaded(Result<String, ApiError>)
    
    case b2Action(B2Action)
}

public struct B1Environment{
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








