//
//  ImageViewController.swift
//  HW_Architecture_Viper
//
//  Created by Давид on 31/10/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, ImagePresenterOutput {

    @IBOutlet weak var picture: UIImageView!
    
    var presenter: ImagePresenterInput!
    var assambler: ImageAssambler = ImageAssambler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assambler.setup(with: self)
        
    }
    
    @IBAction func showImage(_ sender: UIButton) {
        presenter.showImageButtonTapped()
    }
    @IBAction func loadImage(_ sender: UIButton) {
        presenter.loadImageButtonTapped()
    }
    @IBAction func clean(_ sender: UIButton) {
        picture.backgroundColor = nil
        picture.image = nil
        presenter.cleanCachButtonTapped()
        
    }
    
    func showLoadImage(image: UIImage) {
        picture.backgroundColor = nil
        DispatchQueue.main.async {
            self.picture.image = image
        }
    }
    
    func showViewAlerController(error: String) {
        print("ok")
        let alert = UIAlertController(
            title: "Something go wrong",
            message: error,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))
        
        present(alert, animated: true)
    }
}



