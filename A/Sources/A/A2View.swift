//
//  A2View.swift
//  
//
//  Created by Wimes on 2022/01/12.
//

import SwiftUI
import ComposableArchitecture

public struct A2View: View {
    
    let store: Store<A2State, A2Action>
    
    public var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Text("\(viewStore.resultString)")
            }
            .navigationTitle("A2")
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

