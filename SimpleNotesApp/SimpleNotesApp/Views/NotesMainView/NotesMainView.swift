//
//  NotesMainView.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 28.12.2022.
//

import UIKit

class NotesMainView: UIViewController, NotesMainViewInput {
    
    var presenter: NotesMainViewOutput!
    
    lazy var notesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(NoteTableViewCell.self,
                           forCellReuseIdentifier: NoteTableViewCell.identifire)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    func setupPresenter() {
        self.presenter = NotesMainViewPresenter(view: self)
    }
    
    func setupInitialState() {
        self.title = "Заметки"
        setupPresenter()
        setupNotesTableView()
        setupConstraints()
        setupAddButton()
        presenter.createNewNote(title: "Добро пожаловать!",
                                content: "Ваша первая заметка :)")
        
    }
    
    func setupNotesTableView() {
        notesTableView.dataSource = self
        notesTableView.delegate = self
    }
    
    func setupConstraints() {
        view.addSubview(notesTableView)
        NSLayoutConstraint.activate([
            notesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            notesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            notesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            notesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(tapAddButton))
    }
    
    @objc private func tapAddButton() {
        let controller = NotesEditingView()
        controller.setupPresenter(presenter: presenter, data: nil)
        present(controller, animated: true)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.notesTableView.reloadData()
        }
    }
}

extension NotesMainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.dataSize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.loadAllNotes()[indexPath.row]
        let cell = notesTableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifire,
                                                      for: indexPath) as! NoteTableViewCell?
        print(data)
        cell?.noteCellTitle.text = data.noteText
        cell?.noteCellBodyText.text = data.noteName
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notesTableView.deselectRow(at: indexPath, animated: true)
        let data: Note = presenter.loadAllNotes()[indexPath.row]
        let controller = NotesEditingView()
        controller.setupPresenter(presenter: presenter, data: data)
        present(controller, animated: true)
        presenter.updateNote(note: data, newTitle: controller.noteHeaderTextView.text, newContent: controller.noteBodyTextView.text)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let data = presenter.loadAllNotes()[indexPath.row]
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            presenter.deleteNote(note:data)
            tableView.endUpdates()
        }
    }
}
