//
//  QSBookDetailRouter.swift
//  zhuishushenqi
//
//  Created Nory Cao on 2017/4/13.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSBookDetailRouter: QSBookDetailWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(id:String) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = QSBookDetailViewController(nibName: nil, bundle: nil)
        view.id = id
        let interactor = QSBookDetailInteractor()
        let router = QSBookDetailRouter()
        let presenter = QSBookDetailPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
    
    func presentReading(model:[ResourceModel],booDetail:BookDetail){
//        let txtVC = TXTReaderViewController()
//        txtVC.id = id
//        txtVC.resources = model
        viewController?.present(QSTextRouter.createModule(bookDetail:booDetail), animated: true, completion: nil)
    }
    
    func presentComment(id:String){
        let bookCommentVC = BookCommentViewController()
        bookCommentVC.id = id
        viewController?.navigationController?.pushViewController(bookCommentVC, animated: true)
    }
    
    func presentTopic(model:QSBookList){
        viewController?.navigationController?.pushViewController(QSTopicDetailRouter.createModule(id: model.id), animated: true)
    }
    
    func presentSelf(model:QSRecomment){
        viewController?.navigationController?.pushViewController(QSBookDetailRouter.createModule(id: model.id), animated: true)
    }
    
    func presentCommunity(model: BookDetail) {
        viewController?.navigationController?.pushViewController(QSCommunityRouter.createModule(model: model), animated: true)
    }
}
