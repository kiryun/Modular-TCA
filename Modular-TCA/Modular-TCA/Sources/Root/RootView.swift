//
//  RootView.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<RootState, RootAction>
    
    init(store: Store<RootState, RootAction>){
        self.store = store
    }
    
    var body: some View {
        SwitchStore(self.store){
            CaseLet(state: /RootState.login, action: RootAction.loginAction){ store in
                NavigationView{
                    LoginView(store: store)
                }
            }
            CaseLet(state: /RootState.tabBar, action: RootAction.tabBarAction) { store in
                NavigationView{
                    TabBarView(store: store)
                }
            }
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
//}
