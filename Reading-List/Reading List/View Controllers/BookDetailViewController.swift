//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Spencer Curtis on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

	//MARK: - Outlets
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var reasonToReadTextView: UITextView!
	

	// MARK: - Properties
	var bookController: BookController?
	var book: Book? {
		didSet {
			updateViews()
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		updateViews()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}

	// MARK: - Methods
	private func updateViews() {
		navigationItem.title = "Add a new book"
		guard let book = book, isViewLoaded else { return }
		navigationItem.title = book.title
		titleTextField.text = book.title
		reasonToReadTextView.text = book.reasonToRead


//		if book?.title == nil {
//			titleTextField.text = book?.title
//			reasonToReadTextView.text = book?.reasonToRead
//			title = "Add a new book"
//		}
	}

	// MARK: - Actions
	@IBAction func saveButton(_ sender: UIButton) {

		if let book = book {
			bookController?.updateBook(title: titleTextField.text, reasonToRead: reasonToReadTextView.text, book: book)
		} else {
			guard let title = titleTextField.text, let reason = reasonToReadTextView.text else { return }
			bookController?.createABook(title: title, reasonToRead: reason)
		}
		navigationController?.popViewController(animated: true)

//		if book == nil {
//			guard let title = titleTextField.text, let reason = reasonToReadTextView.text else { return }
//			bookController?.createABook(title: title, reasonToRead: reason)
//		}

			//		if let title = titleTextField.text,
			//		let hasBeenRead = book?.hasBeenRead,
			//			let book = book,
			//			let reason = reasonToReadTextView.text {
			//
			//		print(title, hasBeenRead, reason)

			//if bookController?.books == nil {
			//guard let title = titleTextField.text,
			//let hasBeenRead = book.hasBeenRead,
			//let reason = reasonToReadTextView.text else { return }

			//bookController?.createABook(title: title, reasonToRead: reason, hasBeenRead: hasBeenRead)

//		else {
//			if let book = book {
//
//				bookController?.updateBook(title: titleTextField.text, reasonToRead: reasonToReadTextView.text, book: book)
//			}
//			navigationController?.popViewController(animated: true)
//		}
	}
}
