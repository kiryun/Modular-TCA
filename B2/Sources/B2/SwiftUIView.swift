//
//  SwiftUIView.swift
//  
//
//  Created by Wimes on 2022/01/12.
//

import SwiftUI
import ComposableArchitecture

public struct B2View: View {
    let store: Store<B2State, B2Action>
    
    public init(store: Store<B2State, B2Action>){
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Text(viewStore.resultString)
            }
            .navigationTitle("B2")
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
