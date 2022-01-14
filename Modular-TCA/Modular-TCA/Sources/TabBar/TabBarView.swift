//
//  TabBarView.swift
//  Modular-TCA
//
//  Created by Wimes on 2022/01/08.
//

import SwiftUI
import ComposableArchitecture
import A
import B1
import B2

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
                        Text("A")
                    }
                
                NavigationView{
                    B1View(store: self.store.scope(
                        state: \.b1State,
                        action: TabBarAction.b1Action
                    ))
                }
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("B")
                }
            }
        }
    }
}
