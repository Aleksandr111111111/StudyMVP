//
//  MainViewController.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var presenter: MainViewPresenterProtocol!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		
		// Do any additional setup after loading the view.
	}
}
extension MainViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.comments?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		let comment = presenter.comments?[indexPath.row]
		cell.textLabel?.text = comment?.body
		
		return cell
	}
}

extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let comment = presenter.comments?[indexPath.row]
		presenter.tapOnTheComment(comment: comment)
	}
}

extension MainViewController: MainViewProtocol {
	func succes() {
		tableView.reloadData()
	}
	
	func failure(error: Error) {
		print(error.localizedDescription)
	}
}
