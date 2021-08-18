//
//  AsselderModeleBuilder.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import UIKit

protocol AsselderBuilderProtocol {
	func createMainModule(router: RouterProtocol) -> UIViewController
	func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AsselderModelBuilder: AsselderBuilderProtocol {

	func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
		let view = DetailViewController()
		let networkService = NetworkService()
		let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
		view.presenter = presenter
		return view
	}
	
	func createMainModule(router: RouterProtocol) -> UIViewController {
		let view = MainViewController()
		let networkService = NetworkService()
		let presenter = MainPreseter(view: view, networkService: networkService, router: router)
		view.presenter = presenter
		return view
	}
	
	
}

