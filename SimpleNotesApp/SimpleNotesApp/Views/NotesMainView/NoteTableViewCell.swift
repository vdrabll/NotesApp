//
//  NoteTableViewCell.swift
//  SimpleNotesApp
//
//  Created by Виктория Федосова on 28.12.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
      static let identifire = "NoteTableViewCell"
    
     var noteCellTitle: UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Times New Roman", size: 20)
        return lable
    }()
    
    var noteCellBodyText: UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Times New Roman", size: 30)
        return lable
    }()
      
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(noteCellTitle)
        contentView.addSubview(noteCellBodyText)
        activateConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activateConstraints() {
        
        NSLayoutConstraint.activate([
            noteCellTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            noteCellTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            noteCellTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            noteCellTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            noteCellBodyText.topAnchor.constraint(equalTo: contentView.topAnchor ),
            noteCellBodyText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            noteCellBodyText.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            noteCellBodyText.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            
        ])
    }
}
