//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by prakul agarwal on 04/04/24.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    var book: Book?

    @IBOutlet var titleField: UITextField!
    @IBOutlet var authorField: UITextField!
    @IBOutlet var genreField: UITextField!
    @IBOutlet var lengthField: UITextField!

    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "What is your favorite book?"
        updateView()
    }

    func updateView() {
        guard let book = book else { return }

        titleField.text = book.title
        authorField.text = book.author
        genreField.text = book.genre
        lengthField.text = book.length
    }

    @IBAction func save(_ sender: UIButton) {
        guard let title = titleField.text,
              let author = authorField.text,
              let genre = genreField.text,
              let length = lengthField.text else { return }

        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "UnwindToBookTable", sender: self)
    }
}
