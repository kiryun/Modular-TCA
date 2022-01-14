//
//  LoginView.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    
    let store: Store<LoginState, LoginAction>
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            VStack{
                Button {
                    viewStore.send(.logIn(.success("wimes")))
                } label: {
                    Text("logIn")
                }
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
