//
//  MessageCell.swift
//  tasklist
//
//  Created by Diana Tsarkova on 08.12.2020.
//

import UIKit

class MessageCell: UITableViewCell {
    static let reuseId = "message"
    
    var textString: String? {
        didSet {
            messageLabel.text = textString
        }
    }
    
    private let button = UIButton(type: .system)
    private let messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(messageLabel)
        contentView.addSubview(button)
        
        textString = "No string"
        button.tintColor = .black
        button.setTitle("It's me!", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func buttonAction() {
        button.setTitle("YEAP", for: .normal)
        textString = "Activated"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
