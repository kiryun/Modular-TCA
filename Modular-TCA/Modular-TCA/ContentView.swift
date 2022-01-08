//
//  ContentView.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import A1
import ComposableArchitecture

struct ContentView: View {
    let store: Store<RootState, RootAction>
    
    var body: some View {
        WithViewStore(self.store.stateless){ viewStore in
            TabView{
                A1View(store: self.store.scope(
                    state: \.a1State,
                    action: RootAction.a1Action
                ))
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("A1")
                    }
                DummyView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Dummy")
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
