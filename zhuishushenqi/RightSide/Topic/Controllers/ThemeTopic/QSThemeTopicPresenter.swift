//
//  QSThemeTopicPresenter.swift
//  zhuishushenqi
//
//  Created Nory Cao on 2017/4/13.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class QSThemeTopicPresenter: QSThemeTopicPresenterProtocol {

    weak var view: QSThemeTopicViewProtocol?
    let interactor: QSThemeTopicInteractorProtocol
    let router: QSThemeTopicWireframeProtocol

    
    init(interface: QSThemeTopicViewProtocol, interactor: QSThemeTopicInteractorProtocol, router: QSThemeTopicWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(index:Int) {
        interactor.initTitle(index: index)
        interactor.setupSeg(index: index)
        view?.showActivityView()
    }

    func didSelectTitle(index: Int, tag: String, gender: String) {
        view?.showActivityView()
        interactor.requestTitle(index: index, tag: tag, gender: gender)
    }
    
    func didSelectSeg(index: Int){
        view?.showActivityView()
        interactor.requestDetail(index: index)
    }
    
    func didClickFilter(index:Int,title:String,name:String){
        interactor.filter(index: index, title: title, name: name)
    }
    
    func didSelectAt(indexPath:IndexPath,models:[ThemeTopicModel]){
        router.presentDetail(indexPath: indexPath, models: models)
    }
}

extension QSThemeTopicPresenter:QSThemeTopicInteractorOutputProtocol{
    func showSegView(titles: [String]) {
        view?.showSeg(titles: titles)
    }
    
    func showFilter(title: String, index: Int, tag: String, gender: String) {
        view?.showTitle(title: title, index: index, tag: tag, gender: gender)
    }
    
    func fetchModelSuccess(models: [ThemeTopicModel]) {
        view?.hideActivityView()
        view?.showThemeTopic(models: models)
    }
    
    func fetchModelFailed() {
        view?.hideActivityView()
    }
}
