//
//  A1View.swift
//  
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import ComposableArchitecture

public struct A1View: View {
    let store: Store<A1State, A1Action>
    
    public init(store: Store<A1State, A1Action>){
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Text(viewStore.resultString)
                Button {
                    
                } label: {
                    Text("open the A2 View")
                }

            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

//struct A1View_Previews: PreviewProvider{
//    static var previews: some View{
//        A1View(store: Store(
//            initialState: A1State(),
//            reducer: a1Reducer,
//            environment: A1Environment(
//                request: dummyA1Effect,
//                mainQueue: {.main}
//            )
//        ))
//    }
//}
