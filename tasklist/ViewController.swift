//
//  ViewController.swift
//  tasklist
//
//  Created by Diana Tsarkova on 08.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let imageView = UIImageView()
    let tableView = UITableView()
    
    var messagesArray = ["Hello", "Hellooo!", "Nice to see you", "Me too!", "Bye"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "My task list"
        
        view.addSubview(label)
        view.addSubview(imageView)
        view.addSubview(tableView)

        label.attributedText = NSAttributedString(string: "Здарова", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .light)])
        imageView.image = UIImage(named: "anchor")
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        layoutContraints()
    }
    
    private func layoutContraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -26),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 26),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.reuseId, for: indexPath) as? MessageCell
        else {
            return UITableViewCell()
        }
        cell.textString = messagesArray[indexPath.row]
        switch indexPath.row {
        case 3:
            cell.textString = "3333333"
        default:
            print()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        34
    }
}
