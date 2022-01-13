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
                    
//                    // https://stackoverflow.com/questions/57315409/push-view-programmatically-in-callback-swiftui
//                    NavigationLink(
//                        // https://www.pointfree.co/blog/posts/63-the-composable-architecture-%EF%B8%8F-swiftui-bindings
//                        // https://forums.swift.org/t/how-to-use-binding-with-tca/36702/9
//                        isActive: viewStore.binding(
//                            get: \.openTheB2View,
//                            send: .b2Action(.onAppear)
//                        )
//                    ) {
//                        B2View(store: self.store.scope(
//                            state: \.b2State,
//                            action: TabBarAction.b2Action
//                        ))
//                    } label: {
//                        EmptyView()
//                    }


                }
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("B")
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
