//
//  BookController.swift
//  Reading List
//
//  Created by Percy Ngan on 12/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {

	// MARK: -
	var books: [Book] = []

	private var readingListURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return dir.appendingPathComponent("ReadingList.plist")
	}

	func saveToPersistentStore() {
		guard let url = readingListURL else { return }

		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(books)
			try data.write(to: url)
		} catch {
			NSLog("Error saving books data: \(error)")
		}
	}

	
}
