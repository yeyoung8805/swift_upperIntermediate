import SwiftUI

struct NavigationBarWithButton: ViewModifier {

  var title: String = ""
  func body(content: Content) -> some View {
    return content
      .navigationBarItems(
        leading: Text(title)
          .font(.system(size: 24, weight: .bold))
          .padding(),
        trailing: Button(
          action: {
            print("자산추가버튼 tapped")
          },
          label: {
            Image(systemName: "plus")
            Text("자산추가")
              .font(.system(size: 12))
          }
        )
        .accentColor(.black)
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black)
        )
      )
      .navigationBarTitleDisplayMode(.inline)
      onAppear {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTranaparentBackground()
        appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
      }
  }
}

//View 가 함수를 사용할수 있게 한다.
extension View {
  func  navigationBarWithButtonStyle(_ title: String) -> some View {
    return self.modifier(NavigationBarWithButton(title: title))
  }
}


struct NavigationBarWithButton_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Color.gray.edgesIgnoreingSafeArea(.all)
        // .navigationBarWithButtonStyle
        .navigationBarWithButtonStyle("내 자산")
    }
  }
}