import SwiftUI

struct MyView: View {
  let helloFont: Font
  var body: some View {
    VStack {
      Text("Hello, World!")
        .font(.title)
      Text("만나서 반가워요!")
        .font(helloFont)
    }
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}