//
//  TabBarView.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import A1
import ComposableArchitecture

struct TabBarView: View {
    let store: Store<TabBarState, TabBarAction>
    
    var body: some View {
        WithViewStore(self.store){ viewStore in
            TabView{
                A1View(store: self.store.scope(
                    state: \.a1State,
                    action: TabBarAction.a1Action
                ))
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("loginData: \(viewStore.loginData)")
//                        Text("A1")
                    }
                
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
