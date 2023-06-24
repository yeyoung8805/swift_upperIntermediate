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

  private lazy var imagePickerController: UIImagePickerController = {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.allowsEditing = true
    imagePickerController.delegate = self

    return imagePickerController
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
    cell?.setup()

    return cell ?? UITableViewCell()
  }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, 
  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    var selectImage: UIImage? 

    if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      selectImage = editedImage
    } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      selectImage = originalImage
    }

    print(selectImage)

    picker.dismiss(animated: true) { [weak self] in
      let uploadViewController = UploadViewController()
      let navigationController = UINavigationController(rootViewController: uploadViewController)
      navigationController.modalPresentationStyle = .fullScreen

      self?.present(navigationController, animated: true)
    }
  }
}

private extension FeedViewController {
  func setupNavigationBar() {
    navigationItem.title = "Instagram"

    let uploadButton = UIBarButtonItem(
      image: UIImage(systemName: "plus.app"),
      style: plain,
      target: self,
      action: #selector(didTapUploadButton)
    )
    navigationItem.rightBarButtonItem = uploadButton
  }

  @objc func didTapUploadButton() {
    present(imagePickerController, animated: true)
  }

  func setupTableView() {
    view.addSubView(tableView)
    tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }
}