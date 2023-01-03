//
//  NotesNoteView.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 30.12.2022.
//

import Foundation
import UIKit

class NotesEditingView: UIViewController {
    
    var presenter: NotesMainViewOutput!
    var data: Note? 
    
    func setupPresenter(presenter: NotesMainViewOutput, data: Note? ) {
        self.presenter = presenter
        self.data = data
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if noteHeaderTextView.text != "" {
            presenter.createNewNote(title: noteHeaderTextView.text, content: noteBodyTextView.text)
        }
    }
    
    var noteHeaderTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Times New Roman", size: 40)
        textView.textAlignment = .justified
        return textView
    }()
    
     var noteBodyTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Times New Roman", size: 30)
        textView.textAlignment = .justified
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        activateConstrants()
        if self.data != nil {
            noteBodyTextView.text = data?.noteText
        }
    }
    
    func activateConstrants() {
        view.addSubview(noteHeaderTextView)
        
        view.addSubview(noteBodyTextView)
        NSLayoutConstraint.activate([
            noteHeaderTextView.topAnchor.constraint(equalTo: view.topAnchor),
            noteHeaderTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 400),
            noteHeaderTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            noteHeaderTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            noteBodyTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            noteBodyTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            noteBodyTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            noteBodyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


