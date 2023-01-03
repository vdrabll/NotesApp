//
//  NotesMainViewPresenter.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 30.12.2022.
//

import Foundation
import UIKit
import CoreData

class NotesMainViewPresenter: NotesMainViewOutput {
    
    var view: NotesMainViewInput?
    var data: [Note] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    init(view:NotesMainViewInput) {
        self.view = view
        
    }
    
    
    func createNewNote(title: String, content: String) -> Note   {
        var entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let newNote = Note(entity: entity!, insertInto: context)
        newNote.noteName = title
        newNote.noteText = content
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        view?.reloadTableView()
        return newNote
    }
    
    func updateNote(note: Note, newTitle: String, newContent: String) -> Void  {
        note.noteName = newTitle
        note.noteText = newContent
        do {
            try context.save()
            loadAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote(note: Note) {
        context.delete(note)
        do {
            try context.save()
            loadAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dataSize() -> Int {
        var result = 0
        do {
            result = try context.count(for: NSFetchRequest(entityName: "Note"))
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
    func loadAllNotes() -> [Note] {
        do {
            data = try context.fetch(Note.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return data
    }
}
