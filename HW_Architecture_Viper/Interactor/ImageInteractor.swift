//
//  ImageInteractor.swift
//  HW_Architecture_Viper
//
//  Created by Давид on 31/10/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ImageInteractor: ImageInteractorInput {
    
    var imageURL: String?
    var output: ImageInteractorOutput?
    var service: ImageServerSideProtocol?

    func showImage() {
        let cachImage = service?.loadFromCach(url: imageURL)
        output?.setLoadedImige(image: cachImage)
    }
    
    func loadImage() {
        service?.downloadImage(imageURL: imageURL, completion: { (data, error) in
            guard data != nil else {
                self.output?.showAlerController(error: error?.localizedDescription ?? "picture was load early")
                return
            }
        })
    }
    
    func cleanCach() {
        service?.deleteLoadedImage()
    }
}
