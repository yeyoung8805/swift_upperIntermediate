import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SearchBar: UISearchBar {
  let disposeBag = DisposeBag()

  let searchButton = UIButton()

  //SearchBar 버튼 탭 이벤트
  let searchButtonTapped = PublishRelay<Void>()

  //SearchBar 외부로 내보낼 이벤트
  var shouldLoadResult = Observable<String>.of("")

  override init(frame: CGRect) {
    super.init(frame: frame)

    bind()
    attribute()
    layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func bind() {
    //검색을 실행하는 경우의 수 2가지
    //searchBar searchButton tapped
    //customButton tapped
    Observable
      .merge(
        self.rx.searchButtonClicked.asObservable(),
        searchButton.rx.tap.asObservable()
      )
      .bind(to: searchButtonTapped)
      .disposed(by: disposeBag)

    searchButtonTapped
      .asSignal()
      .emit(to: self.rx.endEditing)
      .disposed(by: disposeBag)

    self.shouldLoadResult = searchButtonTapped
      .withLatestFrom(self.rx.text) { $1 ?? "" } //만약 값이 없다면 빈 값인 "" 보내준다.
      .filter { !$0.isEmpty }
      .distinctUntilChanged()
  }

  private func attribute() {
    searchButton.setTitle("검색", for: .normal)
    searchButton.setTitleColor(.systemBlue, for: .normal)

  }

  private func layout() {
    addSubview(searchButton)

    searchTextField.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(12)
      $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
      $0.centerY.equalToSuperview()
    }

    searchButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(12)
    }

  }


}

extension Reactive where Base: SearchBar {
  var endEditing: Binder<Void> {
    return Binder(base) { base, _ in
      base.endEditing(true)
    }
  }
}
