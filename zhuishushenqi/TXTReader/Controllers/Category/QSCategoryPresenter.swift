//
//  QSCategoryPresenter.swift
//  zhuishushenqi
//
//  Created Nory Cao on 2017/4/13.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSCategoryPresenter: QSCategoryPresenterProtocol {

    weak var view: QSCategoryViewProtocol?
    private let interactor: QSCategoryInteractorProtocol
    let router: QSCategoryWireframeProtocol

    var ranks:[QSHotComment] = []
    var show:Bool = false
    
    init(interface: QSCategoryViewProtocol, interactor: QSCategoryInteractorProtocol, router: QSCategoryWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(id: String) {
        view?.showActivityView()
    }
    
}

extension QSCategoryPresenter:QSCategoryInteractorOutputProtocol{
    func fetchBookSuccess(bookDetail:BookDetail,ranks:[QSHotComment]){
        self.ranks = ranks
        
        view?.hideActivityView()
    }
    
    func fetchRankFailed() {
        view?.hideActivityView()
    }
    
    func fetchContent(show: Bool) {
        
    }
    
    func fetchAllChapterSuccess(bookDetail:BookDetail,res:[ResourceModel]){
        router.presentReading(model: res, booDetail: bookDetail)
        view?.hideActivityView()
    }
    
    func fetchAllChapterFailed(){
        view?.hideActivityView()
    }
}
