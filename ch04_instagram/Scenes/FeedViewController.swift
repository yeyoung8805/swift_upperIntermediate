import SnapKit
import UIKit

class FeedViewController: UIViewController {
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.backgroundColor = .systemBackground
    tableView.seperatorStyle = .none
    tableView.dataSource = self

    tableView.register(FeedTableViewCell.self, forCellReuseItentifier: "FeedTableViewCell")

    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavigationBar()
    setupTableView()
  }
}

extension FeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell
    cell?.selectionStyle = .none

    return cell ?? UITableViewCell()
  }
}

private extension FeedViewController {
  func setupNavigationBar() {
    navigationItem.title = "Instagram"

    let uploadButton = UIBarButtonItem(
      image: UIImage(systemName: "plus.app"),
      style: plain,
      target: self,
      action: nil
    )
    navigationItem.rightBarButtonItem = uploadButton
  }

  func setupTableView() {
    view.addSubView(tableView)
    tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
}