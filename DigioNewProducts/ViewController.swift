//
//  ViewController.swift
//  DigioNewProducts
//
//  Created by Marcell Ribeiro on 02/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var spotlightCollectionView: UICollectionView!
    @IBOutlet weak var digioCashImageView: UIImageView!
    @IBOutlet weak var digioCashButton: UIButton!
    @IBOutlet weak var productsCollectionView: UICollectionView!

    var viewModel: ProductsResponseModel?

    var digioApiService: DigioApiProtocol?

    var selectedTitle:String = ""
    var selectedDescription:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.accessibilityIdentifier = "mainViewController"
        self.greetingsLabel.accessibilityIdentifier = "greetingsLabel"
        self.digioCashImageView.accessibilityIdentifier = "digioCashImageView"
        self.digioCashButton.accessibilityIdentifier = "digioCashButton"
        self.spotlightCollectionView.accessibilityIdentifier = "spotlightCollectionView"
        self.productsCollectionView.accessibilityIdentifier = "productsCollectionView"

        self.setup()
        self.getProducts()
    }

    func setup() {
        self.greetingsLabel.text = "Carregando..."
        self.digioCashImageView.rounded()

        let httpService = UrlSessionHttpService()
        self.digioApiService = DigioApiService(httpService: httpService)
    }

    func getProducts() {
        guard let apiService = self.digioApiService else {
            return
        }
        apiService.getProducts { [weak self] (products) in
            guard let products = products else {
                return
            }

            DispatchQueue.main.async {
                self?.viewModel = products
                self?.updateViews()
            }
        }
    }

    func updateViews() {
        self.greetingsLabel.text = "Olá, Nome"
        if let imageUrl = self.viewModel?.cash.bannerUrl {
            self.digioCashImageView.setNetworkImage(imageUrl: imageUrl)
        }
        self.spotlightCollectionView.reloadData()
        self.productsCollectionView.reloadData()
    }

    func didSelectItem(name: String, description: String) {
//        let vc = ViewController()
//        self.selectedTitle = name
//        self.selectedDescription = description


        let storyBoard: UIStoryboard = UIStoryboard(name: "Description", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "descriptionViewController") as! DescriptionViewController

        newViewController.selectedTitle = name
        newViewController.selectedDescription = description
        self.present(newViewController, animated: true, completion: nil)


//        let storyBoard: UIStoryboard = UIStoryboard(name: "Description", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "descriptionViewController") as! DescriptionViewController
//        self.present(newViewController, animated: true, completion: nil)


//        let alert = UIAlertController(
//            title: name,
//            message: description,
//            preferredStyle: .alert
//        )
//        alert.addAction(UIAlertAction(
//            title: "OK",
//            style: .default, handler: nil
//        ))
//        self.present(alert, animated: true)
    }

    @IBAction func didTapDigioCashButton(_ sender: Any) {
        guard let cash = self.viewModel?.cash else {
            return
        }
        self.didSelectItem(name: cash.title, description: cash.description)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.spotlightCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SpotlightCollectionViewCell.className, for: indexPath) as! SpotlightCollectionViewCell

            if let spotlight = self.viewModel?.spotlight[indexPath.row]{
                cell.setImage(spotlight.bannerUrl)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.className, for: indexPath) as! ProductCollectionViewCell

            if let product = self.viewModel?.products[indexPath.row] {
                cell.setImage(product.imageUrl)
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }

        if collectionView == self.spotlightCollectionView {
            return viewModel.spotlight.count
        } else {
            return viewModel.products.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var name: String?
        var description: String?

        if collectionView == self.spotlightCollectionView {
            if let spotlight = self.viewModel?.spotlight[indexPath.row]{
                name = spotlight.name
                description = spotlight.description
            }
        } else if let product = self.viewModel?.products[indexPath.row] {
            name = product.name
            description = product.description
        }

        if let description = description, let name = name {
            self.didSelectItem(name: name, description: description)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        var width = collectionView.bounds.width - 40

        if collectionView == self.productsCollectionView {
            width = 140
        }
        return CGSize(
            width: width,
            height: collectionView.bounds.size.height
        )
    }
}
