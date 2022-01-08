import Foundation
import Combine
import ComposableArchitecture

public enum ApiError: Error{
    case downloadError
    case decodingError
}

public protocol Effects{
    func numbersApiOne() -> Effect<String, ApiError>
    func numbersApiTwo() -> Effect<String, ApiError>
    func numbersApiThree() -> Effect<String, ApiError>
    func numbersApiFour() -> Effect<String, ApiError>
}

public class EffectsImpl: Effects{
    public init(){}
    public func numbersApiOne() -> Effect<String, ApiError>{
        guard let url = URL(string: "http://numbersapi.com/1") else{
            fatalError("Error on creating url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.downloadError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    
    public func numbersApiTwo() -> Effect<String, ApiError>{
        guard let url = URL(string: "http://numbersapi.com/2") else{
            fatalError("Error on creating url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.downloadError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    
    public func numbersApiThree() -> Effect<String, ApiError>{
        guard let url = URL(string: "http://numbersapi.com/3") else{
            fatalError("Error on creating url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.downloadError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
    
    public func numbersApiFour() -> Effect<String, ApiError>{
        guard let url = URL(string: "http://numbersapi.com/4") else{
            fatalError("Error on creating url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError{_ in ApiError.downloadError}
            .map(\.data)
            .compactMap{ String(data: $0, encoding: .utf8)}
            .eraseToEffect()
    }
}
