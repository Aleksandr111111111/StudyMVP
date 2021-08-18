//
//  Comment.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//

import Foundation

struct Comment: Decodable {
	
	let postId: Int
	let id: Int
	let name: String
	let email: String
	let body: String
	
}
