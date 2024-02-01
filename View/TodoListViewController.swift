//
//  TodoListViewController.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit


class TodoListViewController: UIViewController 
{
    
    var task: Task?
    
    var tableView = UITableView()
    
    var emptyView = UIView()
    lazy var rightButton: UIBarButtonItem = 
    {
        let button = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(didTapAdd))
        return button
    }()
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubViews()
        makeAutoLayout()
        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.emptyView.isHidden = TaskList.taskList().count != 0
    }
    
    private func addSubViews() 
    {
        navigationItem.rightBarButtonItem = rightButton
        view.addSubview(tableView)
        view.addSubview(emptyView)
    }
    
    private func makeAutoLayout() 
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0),
        ])
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            emptyView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            emptyView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            emptyView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0),
        ])
        
    }

    
    @objc
    func didTapAdd(_ sender: Any) 
    {
        let alertController = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in textField.placeholder = "할 일을 입력하세요" }
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            
            guard let self else { return }
            
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                let defaultCategory = TaskCategory.none
                let newItem = Task(id: (TaskList.taskList().last?.id ?? -1) + 1, title: title, isCompleted: false, category: defaultCategory)
                
                TaskList.addTask(newItem)
                self.tableView.insertRows(at: [IndexPath(row: TaskList.filterByCategory(category: defaultCategory).count-1, section: defaultCategory.toIndex())], with: .automatic)
                self.emptyView.isHidden = TaskList.taskList().count != 0
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension TodoListViewController: UITableViewDelegate 
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoListViewController: UITableViewDataSource 
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        if section == TaskCategory.none.toIndex() 
        {
            return TaskList.filterByCategory(category: .none).count
        }
        
        else if section == TaskCategory.work.toIndex()
        {
            return TaskList.filterByCategory(category: .work).count
        }
        
        else if section == TaskCategory.life.toIndex()
        {
            return TaskList.filterByCategory(category: .life).count
        }
        
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.cellId, for: indexPath) as! TodoListTableViewCell
        
        if indexPath.section == TaskCategory.none.toIndex()
        {
            cell.setTask(TaskList.filterByCategory(category: .none)[indexPath.row])
        } 
        
        else if indexPath.section == TaskCategory.work.toIndex()
        {
            cell.setTask(TaskList.filterByCategory(category: .work)[indexPath.row])
        }
        
        else if indexPath.section == TaskCategory.life.toIndex()
        {
            cell.setTask(TaskList.filterByCategory(category: .life)[indexPath.row])
        }
        
        else
        {
            return UITableViewCell()
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int 
    {
        return TaskCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? 
    {
        guard TaskList.taskList().count != 0 else { return nil }
        guard let category = TaskCategory.category(from: section) else { return nil }
        let titleHeader = category.rawValue
        return TaskList.filterByCategory(category: category).isEmpty ? nil : titleHeader    
    }
}
