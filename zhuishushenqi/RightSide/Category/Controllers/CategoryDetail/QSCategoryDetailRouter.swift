//
//  QSCategoryDetailRouter.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/20.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSCategoryDetailRouter: QSCategoryDetailWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(param:[String:Any]) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = QSCategoryDetailViewController(nibName: nil, bundle: nil)
        let interactor = QSCategoryDetailInteractor()
        let router = QSCategoryDetailRouter()
        let presenter = QSCategoryDetailPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        interactor.param = param
        return view
    }
    
    func presentDetail(book:Book) {
        viewController?.navigationController?.pushViewController(QSBookDetailRouter.createModule(id: book._id ?? ""), animated: true)
    }
}
