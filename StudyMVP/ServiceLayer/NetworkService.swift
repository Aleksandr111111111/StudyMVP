//
//  NetworkService.swift
//  StudyMVP
//
//  Created by Aleksander Kulikov on 18.08.2021.
//
//https://jsonplaceholder.typicode.com/comments
import Foundation

protocol NetworkServiceProtocol {
	func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}
class NetworkService: NetworkServiceProtocol {
	func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
		let urlString = "https://jsonplaceholder.typicode.com/comments"
		guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
			}
			do {
				let obj = try JSONDecoder().decode([Comment].self, from: data!)
				completion(.success(obj))
			} catch {
				completion(.failure(error))
			}			
		}.resume()
	}
	
	
}
