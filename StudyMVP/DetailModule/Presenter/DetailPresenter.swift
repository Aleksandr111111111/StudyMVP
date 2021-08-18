//
//  DetailPresenter.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import Foundation

protocol DetailViewProtcol {
	func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol {
	init(view: DetailViewProtcol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
	func setComment()
	func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
	var view: DetailViewProtcol?
	let networkService: NetworkServiceProtocol!
	var router: RouterProtocol?
	var comment: Comment?
	
	required init(view: DetailViewProtcol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
		self.view = view
		self.networkService = networkService
		self.router = router
		self.comment = comment
	}
	
	public func setComment() {
		self.view?.setComment(comment: comment)
	}
	func tap() {
		router?.popToRoot()
	}
}
