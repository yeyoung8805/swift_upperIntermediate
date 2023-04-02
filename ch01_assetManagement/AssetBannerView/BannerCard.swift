import SwiftUI

struct BannerCard: View {
  var banner: AssetBanner
  var body: some View {
    //방법1 다른 표현 방법
    // ZStack {
    //   Color(banner.backgoundColor)
    //   VStack {
    //       Text(banner.title)
    //         .font(.title)
    //       Text(banner.description)
    //         .font(.subheadline)
    //     }
    // }

    //방법2
    Color(banner.backgoundColor)
      .overlay(
        VStack {
          Text(banner.title)
            .font(.title)
          Text(banner.description)
            .font(.subheadline)
        }
      )
  }
}

struct BannerCard_Previews: PreviewProvider {
  static var previews: some View {
    let banner0 = AssetBanner(title: "공지사항", 
      description: "추가된 공지사항을 확인하세요.", 
      backgroundColor: .red)
    BannerCard(banner: banner0)
  }
}