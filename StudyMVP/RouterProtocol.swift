//
//  RouterProtocol..swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import UIKit

protocol MainRouterProtocol {
	var navigationController: UINavigationController? { get set }
	var assemblyBuilder: AsselderBuilderProtocol? { get set }
}

protocol RouterProtocol: MainRouterProtocol {
	func initialViewController()
	func showDetail(comment: Comment)
	func popToRoot()
}

class Router: RouterProtocol {
	var navigationController: UINavigationController?
	var assemblyBuilder: AsselderBuilderProtocol?
	
	init (navigationController: UINavigationController, assemblyBuilder: AsselderBuilderProtocol) {
		self.navigationController = navigationController
		self.assemblyBuilder = assemblyBuilder
	}
	
	func initialViewController() {
		if let navigationController = navigationController {
			guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
			navigationController.viewControllers = [mainViewController]
		}
	}
	
	func showDetail(comment: Comment) {
		if let navigationController = navigationController {
			guard let detailViewController = assemblyBuilder?.createDetailModule(comment: comment, router: self) else { return }
			navigationController.pushViewController(detailViewController, animated: true)
		}
	}
	
	func popToRoot() {
		if let navigationController = navigationController {
			navigationController.popToRootViewController(animated: true)
		}
	}
	

	
	
}
