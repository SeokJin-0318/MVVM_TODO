//
//  ViewController.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit


class CatViewController: UIViewController 
{
    
    var catImageView: UIImageView = 
    {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        return imageView
    }()
    
    let refreshButton: UIButton = 
    {
        let button = UIButton()
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    lazy var widthConstraint: NSLayoutConstraint = catImageView.widthAnchor.constraint(equalToConstant: 100)

    lazy var heightConstraint: NSLayoutConstraint = catImageView.heightAnchor.constraint(equalToConstant: 100)

    
    @IBAction func refreshImage(_ sender: Any) 
    {
        setImageFrom(path: "images/search")
    }
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(catImageView)
        self.view.addSubview(refreshButton)
        
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            catImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            widthConstraint,
            heightConstraint
        ])
        
        catImageView.image = UIImage(systemName: "photo")
        self.catImageView.translatesAutoresizingMaskIntoConstraints = false
        self.setImageFrom(path: "images/search")
    }
    
    func setImageFrom(path: String) 
    {
        URLManager.shared.getJsonData(path: path) { [weak self] result in
            guard let self else { return }
            
            switch result
            {
            case .success(let data):
                guard let imageAPI = data.first else { return }
                
                DispatchQueue.main.async
                {
                    if CGFloat(imageAPI.width) > UIScreen.main.bounds.width 
                    {
                        let ratio = UIScreen.main.bounds.width / CGFloat(imageAPI.width)
                        let width = CGFloat(imageAPI.width) * ratio
                        let height = CGFloat(imageAPI.height) * width / CGFloat(imageAPI.width)
                        self.widthConstraint.constant = width
                        self.heightConstraint.constant = height
                    }
                    
                    else 
                    {
                        self.widthConstraint.constant = CGFloat(imageAPI.width)
                        self.heightConstraint.constant = CGFloat(imageAPI.height)
                    }
                    
                    self.title = imageAPI.id
                    self.catImageView.getImageFromURL(url: imageAPI.url)
                }
                
            case .failure(let error):
                DispatchQueue.main.async
                {
                    self.title = error.localizedDescription
                    self.catImageView.image = UIImage(systemName: "x.circle")
                }
            }
        }
    }
}
