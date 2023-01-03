//
//  NotesMainViewOutput.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 28.12.2022.
//

import Foundation

protocol NotesMainViewOutput {
    func createNewNote(title: String, content: String) -> Note
    func loadAllNotes() -> [Note]
    func updateNote(note: Note, newTitle: String, newContent: String) -> Void
    func deleteNote(note: Note) -> Void
    func dataSize() -> Int
    
    // функции загрузки списка заметок из модели
    // презентер должен загружать уже созданные заметка на экран из 
    
}
