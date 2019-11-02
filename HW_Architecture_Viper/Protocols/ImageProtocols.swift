//
//  ImageProtocols.swift
//  HW_Architecture_Viper
//
//  Created by Давид on 31/10/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

protocol ImageInteractorInput: AnyObject {
    
    func showImage()
    func loadImage()
    func cleanCach()
}

protocol ImageInteractorOutput: AnyObject {
    
    func setLoadedImige(image: Data?)
    func showAlerController(error: String)
}

protocol ImagePresenterInput: AnyObject {
    
    func showImageButtonTapped()
    func loadImageButtonTapped()
    func cleanCachButtonTapped()
}

protocol ImagePresenterOutput: AnyObject {

    func showLoadImage(image: UIImage)
    func showViewAlerController(error: String)
}

protocol ImageServerSideProtocol {
    func downloadImage(imageURL: String?, completion: @escaping (Data?, Error?) -> Void)
    func loadFromCach(url: String?) -> Data?
    func deleteLoadedImage()
}
