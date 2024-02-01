//
//  ProfileDesignViewController.swift
//  MVVM_TODO
//
//  Created by 석진 on 1/29/24.
//

import UIKit
import SwiftUI

func makeLabel(_ text: String, _ font: String, _ size: CGFloat) -> UILabel
{
    let label = UILabel()
    
    label.text = text
    label.textAlignment = .center
    label.font = UIFont(name: font, size: size)
    
    return label
}


var posts: Int = 7
var followers: Int = 0
var followings: Int = 0

class ProfileDesignViewController: UIViewController
{

    let IDLabel = makeLabel("nabaecamp", "OpenSans-Bold", 18)
    
    let menuBar: UIButton =
    {
        let button = UIButton()
        
        button.setImage(UIImage(named: "MenuBar"), for: .normal)
        
        return button
    }()
    
    let profileImage: UIImageView =
    {
        let imageView = UIImageView(image: UIImage(named: "ProfileImage"))
        
        return imageView
    }()
    
    let postValue = makeLabel(String(posts), "OpenSans-Bold", 16.5)
    let postLabel = makeLabel("post", "OpenSans-Regular", 14)
    
    let followerValue = makeLabel(String(followers), "OpenSans-Bold", 16.5)
    let followerLabel = makeLabel("follower", "OpenSans-Regular", 14)
    
    let followingValue = makeLabel(String(followings), "OpenSans-Bold", 16.5)
    let followingLabel = makeLabel("following", "OpenSans-Regular", 14)
    
    let nameLabel = makeLabel("르탄이", "OpenSans-Bold", 14)
    let bioLabel = makeLabel("iOS Developer 🍎", "OpenSans-Regular", 14)
    let linkLabel = makeLabel("spratacodingclub.kr", "OpenSans-Regular", 14)
    
    let followButton: UIButton =
    {
        let button = UIButton()
        
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        button.layer.cornerRadius = 4
        
        return button
    }()
    
    let messageButton: UIButton =
    {
        let button = UIButton()
        
        button.setTitle("Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        
        return button
    }()
    
    let moreButton: UIButton =
    {
        let button = UIButton()
        
        button.setImage(UIImage(named: "MoreButton"), for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        
        return button
    }()
    
    let stroke: UIView =
    {
        let stroke = UIView()
        
        stroke.layer.borderWidth = 0.5
        stroke.layer.borderColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1).cgColor
        
        return stroke
    }()

    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        addSubViews()
        setAutolayout()
    }
    
    func addSubViews()
    {
        view.addSubview(IDLabel)
        view.addSubview(menuBar)
        view.addSubview(profileImage)
        view.addSubview(postValue)
        view.addSubview(postLabel)
        view.addSubview(followerValue)
        view.addSubview(followerLabel)
        view.addSubview(followingValue)
        view.addSubview(followingLabel)
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)
        view.addSubview(linkLabel)
        view.addSubview(followButton)
        view.addSubview(messageButton)
        view.addSubview(moreButton)
        view.addSubview(stroke)
    }
    
    
    func setAutolayout()
    {
        IDLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            IDLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            IDLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -320)
        ])
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 160),
            menuBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -320),
            menuBar.widthAnchor.constraint(equalToConstant: 21),
            menuBar.heightAnchor.constraint(equalToConstant: 17.5)
        ])
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -140),
            profileImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -240),
            profileImage.widthAnchor.constraint(equalToConstant: 88),
            profileImage.heightAnchor.constraint(equalToConstant: 88)
        ])
        
        postValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -30),
            postValue.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
        ])
        
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -30),
            postLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -230)
        ])
        
        followerValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 52),
            followerValue.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
        ])
        
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 52),
            followerLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -230)
        ])
        
        followingValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 134),
            followingValue.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
        ])
        
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 134),
            followingLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -230)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -160),
            nameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -170)
        ])
        
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -115),
            bioLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -145)
        ])
        
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -110),
            linkLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -120)
        ])
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100),
            followButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -70),
            followButton.widthAnchor.constraint(equalToConstant: 150),
            followButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 60),
            messageButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -70),
            messageButton.widthAnchor.constraint(equalToConstant: 150),
            messageButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 160),
            moreButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -70),
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            moreButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        stroke.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        stroke.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -60),
        stroke.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
}

struct PreView: PreviewProvider 
{
    static var previews: some View 
    {
        ProfileDesignViewController().toPreview()
    }
}


#if DEBUG
extension UIViewController 
{
    private struct Preview: UIViewControllerRepresentable 
    {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController
        {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context)
        {
        }
    }

    func toPreview() -> some View
    {
        Preview(viewController: self)
    }
}
#endif
