//
//  B1View.swift
//  
//
//  Created by Wimes on 2022/01/10.
//

import SwiftUI
import ComposableArchitecture

struct SwiftUIView: View {
    
    let store: Store<B1State, B1Action>
    
    public init(store: Store<B1State, B1Action>){
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Text(viewStore.loginData)
                Text(viewStore.resultString)
            }
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
