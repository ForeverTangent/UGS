//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 7/13/21.
//

import Foundation

/**
Protocol Extention to get JSON Description
*/
protocol JSONDescription: Codable {
	var jsonDescription: String { get }
}

extension JSONDescription {
	var jsonDescription: String {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let data = try? encoder.encode(self)
		return String(data:data!, encoding: .utf8)!
	}
}
