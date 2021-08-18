//
//  DetailViewController.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailComent: UILabel!
	
	var presenter: DetailViewPresenterProtocol!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.setComment()
		// Do any additional setup after loading the view.
	}
	
	@IBAction func tapAction(_ sender: Any) {
		presenter.tap()
	}
}

extension DetailViewController: DetailViewProtcol {
	func setComment(comment: Comment?) {
		detailComent.text = comment?.body
	}
}
