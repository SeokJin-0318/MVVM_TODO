//
//  TodoListTableViewCell.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit


class TodoListTableViewCell: UITableViewCell 
{
    static var cellId = "cellid"
    
    var taskSwitch: UISwitch = 
    {
       let `switch` = UISwitch()
        `switch`.isOn = false
        return `switch`
    }()

    var task: Task? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) 
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskSwitch)
        taskSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            taskSwitch.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            taskSwitch.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        taskSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
    }
    
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func switchChanged(_ sender: Any) 
    {
        guard let task else { return }
        
        if taskSwitch.isOn 
        {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
            TaskList.completeTask(task: task, isCompleted: true)
        } 
        
        else
        {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
            TaskList.completeTask(task: task, isCompleted: false)
        }
    }
    
    func setTask(_ _task: Task) 
    {
        task = _task
        guard let task else { return }
        
        if task.isCompleted 
        {
            textLabel?.text = nil
            textLabel?.attributedText = task.title.strikeThrough()
        }
        
        else
        {
            textLabel?.attributedText = nil
            textLabel?.text = task.title
        }
        taskSwitch.isOn = task.isCompleted
    }
}
