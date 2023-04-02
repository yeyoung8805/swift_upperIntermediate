import SwiftUI

struct MyView: View {
  var body: some View {
    VStack {
      VStack {
        Text("Hello, World!")
        Text("만나서 반가워요!")
      }
      VStack {
        Text("Hello")
      }
    }
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}