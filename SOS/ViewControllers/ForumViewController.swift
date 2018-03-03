//
//  ForumViewController.swift
//  SOS
//
//  Created by C4Q on 3/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ForumViewController: UIViewController {
    var forumView = ForumView()
    
    var forumQuestions: [ForumQuestion] = [] {
        didSet {
            forumView.tableView.reloadData()
            print("forumQuestions: \(forumQuestions.count)")
        }
    }
    
    var categories: [String] = [] {
        didSet {
            print("categories: \(categories)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let questions = JSONParsingService.parseJSONFile(filename: "ForumQA", type: "json") {
            forumQuestions = questions
        }
        
        // load question categories
        for ques in forumQuestions {
            categories.append(ques.category)
        }
        
        view.addSubview(forumView)
        view.backgroundColor = Stylesheet.Colors.White
        forumView.tableView.dataSource = self
        forumView.tableView.rowHeight = UITableViewAutomaticDimension
        forumView.tableView.estimatedRowHeight = 120
        
        configureNavBar()
    }

    private func configureNavBar() {
        navigationItem.title = "F.A.Q."
        
        let askBarItem = UIBarButtonItem(title: "Ask", style: .plain, target: self, action: #selector(askAQuestion))
        navigationItem.rightBarButtonItem = askBarItem
    }
    
    @objc func askAQuestion() {
        let addQuestionVC = AddQuestionViewController()
        present(addQuestionVC, animated: true, completion: nil)
    }

}


extension ForumViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // load number of question cells per category
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 5
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumQuestionCell", for: indexPath) as! ForumQuestionTableViewCell
//            let currentQuestion = forumQuestions[indexPath.row]
            let currentQuestion = forumQuestions[0]
            cell.questionLabel.text = currentQuestion.question
            cell.answerLabel.text = currentQuestion.answer
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumQuestionCell", for: indexPath) as! ForumQuestionTableViewCell
//            let currentQuestion = forumQuestions[indexPath.row]
            let currentQuestion = forumQuestions[1]
            cell.questionLabel.text = currentQuestion.question
            cell.answerLabel.text = currentQuestion.answer
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumQuestionCell", for: indexPath) as! ForumQuestionTableViewCell
//            let currentQuestion = forumQuestions[indexPath.row]
            let currentQuestion = forumQuestions[2]
            cell.questionLabel.text = currentQuestion.question
            cell.answerLabel.text = currentQuestion.answer
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumQuestionCell", for: indexPath) as! ForumQuestionTableViewCell
//            let currentQuestion = forumQuestions[indexPath.row]
            let currentQuestion = forumQuestions[0]
            cell.questionLabel.text = currentQuestion.question
            cell.answerLabel.text = currentQuestion.answer
            return cell
            
        }
    }
    
    
}


