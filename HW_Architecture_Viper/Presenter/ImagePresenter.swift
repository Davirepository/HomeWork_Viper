//
//  ImagePresenter.swift
//  HW_Architecture_Viper
//
//  Created by Давид on 31/10/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit


class ImagePresenter: ImagePresenterInput, ImageInteractorOutput {
    var interactor: ImageInteractorInput?
    var output: ImagePresenterOutput?
    
    func showImageButtonTapped() {
        interactor?.showImage()
    }
    func loadImageButtonTapped() {
        interactor?.loadImage()
    }
    func cleanCachButtonTapped() {
        interactor?.cleanCach()
    }
    
    func setLoadedImige(image: Data?) {
        guard let cachImage = image else {
            self.output?.showViewAlerController(error: "Your cach is clean")
            return
        }
        output?.showLoadImage(image: UIImage(data: cachImage)!)
    }
    func showAlerController(error: String) {
        output?.showViewAlerController(error: error)
    }
}
