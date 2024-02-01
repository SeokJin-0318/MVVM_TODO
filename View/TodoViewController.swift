//
//  TodoViewController.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit


class TodoViewController: UIViewController
{

    let mainImageView: UIImageView = 
    {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        return imageView
    }()
    
    let todoButton: UIButton = 
    {
        let button = UIButton()
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let profileButton: UIButton =
    {
        let button = UIButton()
        button.setTitle("ProfileDesignViewController", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let dogButton: UIButton = 
    {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cat"), for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubViews()
        makeAutoLayout()
        setupInteraction()
        mainImageView.getImageFromURL(url: "https://spartacodingclub.kr/css/images/scc-og.jpg")
        
    }
    
    private func setupInteraction() 
    {
        todoButton.addTarget(self, action: #selector(touchTodoButton), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(touchProfileButton), for: .touchUpInside)
        dogButton.addTarget(self, action: #selector(touchDogButton), for: .touchUpInside)
    }
    
    @objc
    func touchTodoButton() 
    {
        self.navigationController?.pushViewController(TodoListViewController(), animated: true)
    }
    
    @objc
    func touchProfileButton()
    {
        self.navigationController?.pushViewController(ProfileDesignViewController(), animated: true)
    }
    
    @objc
    func touchDogButton() 
    {
        self.navigationController?.pushViewController(CatViewController(), animated: true)
    }
    
    private func addSubViews() 
    {
        view.addSubview(mainImageView)
        view.addSubview(todoButton)
        view.addSubview(profileButton)
        view.addSubview(dogButton)
    }
    
    private func makeAutoLayout() 
    {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            mainImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200),
            mainImageView.widthAnchor.constraint(equalToConstant: 200),
            mainImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        todoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            todoButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            todoButton.widthAnchor.constraint(equalToConstant: 100),
            todoButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0), 
            profileButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100),
            profileButton.widthAnchor.constraint(equalToConstant: 300),
            profileButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        dogButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dogButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            dogButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            dogButton.widthAnchor.constraint(equalToConstant: 100),
            dogButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
