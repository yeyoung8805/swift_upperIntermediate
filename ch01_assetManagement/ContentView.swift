import SwiftUI

struct ContentView: View {
  @State private var selection: Tab = .asset

  enum Tab {
    case asset 
    case recommend
    case alert
    case setting
  }

  var body: some View {
    TabView(selection: $selection) {
      Color.white //AssetView() 로 추가할것!
        .tabItem {
          Image(systemName: "dollarsign.circle.fill")
          Text("자산")
        }
        .tag(Tab.asset)
      Color.blue
        .edgesIgnoreingSafeArea(.all)
        .tabItem {
          Image(systemName: "hand.thumbsup.fill")
          Text("추천")
        }  
        .tag(Tab.recommend)
      Color.yellow
        .edgesIgnoreingSafeArea(.all)
        .tabItem {
          Image(systemName: "bell.fill")
          Text("알림")
        }  
        .tag(Tab.alert)
      Color.red
        .edgesIgnoreingSafeArea(.all)
        .tabItem {
          Image(systemName: "gearshape.fill")
          Text("설정")
        }  
        .tag(Tab.setting)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}