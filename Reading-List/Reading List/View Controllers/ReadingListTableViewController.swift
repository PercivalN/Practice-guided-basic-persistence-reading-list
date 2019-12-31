//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Percy Ngan on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController, BookTableViewCellDelegate {

	// MARK: - Properties
	let bookController = BookController()

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	// MARK: - Helper methods
	func bookFor(indexpath: IndexPath) -> Book {
		bookController.books[indexpath.row]
	}

	func toggleHasBeenRead(for cell: BookTableViewCell) {
		guard let indexPath = tableView.indexPath(for: cell) else { return }
		let book = bookFor(indexpath: indexPath)
		bookController.updateHasBeenRead(for: book)
		tableView.reloadData()
	}

	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Read Books"
		} else {
			return "Unread Books"
		}
	}


	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return bookController.readBooks.count
		} else {
			return bookController.unreadBooks.count
		}
	}


	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

		guard let bookCell = cell as? BookTableViewCell else { return cell }
		bookCell.delegate = self
		bookCell.book = bookFor(indexpath: indexPath)

		return bookCell
	}

	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AddBookSegue" {
			if let addBookVC = segue.destination as? BookDetailViewController {
			addBookVC.bookController = bookController
		} else if segue.identifier == "ShowDetailSegue" {
			if let indexPath = tableView.indexPathForSelectedRow,
				let showDetailVC = segue.destination as? BookDetailViewController {
				showDetailVC.book = bookFor(indexpath: indexPath)
				showDetailVC.bookController = bookController
			}
		}
	}
}
}
