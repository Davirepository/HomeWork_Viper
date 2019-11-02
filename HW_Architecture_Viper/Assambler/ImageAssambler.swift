//
//  ImageAssambler.swift
//  HW_Architecture_Viper
//
//  Created by Давид on 31/10/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
class ImageAssambler {
    func setup(with viewController: ImageViewController) {
        let presentor = ImagePresenter()
        let interactor = ImageInteractor()
        let service = ServerService()
        let entity = ImageModel(image: "http://icons.iconarchive.com/icons/dtafalonso/ios8/512/Calendar-icon.png")
        
        viewController.presenter = presentor
        presentor.interactor = interactor
        interactor.output = presentor
        presentor.output = viewController
        interactor.imageURL = entity.image
        interactor.service = service
    }
}
