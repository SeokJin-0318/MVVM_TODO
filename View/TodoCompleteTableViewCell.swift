//
//  TodoCompleteTableViewCell.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit


class TodoCompleteTableViewCell: UITableViewCell 
{

    var task: Task?
    
    func setTask(_ _task: Task) 
    {
        task = _task
        guard let task else { return }
        
        textLabel?.text = task.title
    }
    
    override func awakeFromNib() 
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) 
    {
        super.setSelected(selected, animated: animated)
    }

}
