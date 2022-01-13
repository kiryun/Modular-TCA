//
//  B1View.swift
//  
//
//  Created by Wimes on 2022/01/10.
//

import SwiftUI
import ComposableArchitecture
import B2

public struct B1View: View {
    
    let store: Store<B1State, B1Action>
    
    public init(store: Store<B1State, B1Action>){
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Text("login Data: "+viewStore.loginData)
                Text(viewStore.resultString)
                NavigationLink {
                    B2View(store: self.store.scope(
                            state: \.b2State,
                            action: B1Action.b2Action
                        ))
                } label: {
                    Text("Open the B2View")
                }
            }
            .navigationTitle("B1")
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
