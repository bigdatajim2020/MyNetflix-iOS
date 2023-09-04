//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Jim Yang on 2023-08-21.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let titleLable: UILabel = {
        let lable=UILabel()
        lable.translatesAutoresizingMaskIntoConstraints=false
        lable.font = .systemFont(ofSize: 22, weight: .bold)
        lable.text = "Barbie"
        lable.textColor = .white
        return lable
    }()
    
    private let overviewLable : UILabel = {
       let lable = UILabel()
        lable.font = .systemFont(ofSize: 18, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        lable.text = "This is the best movie ever"
        lable.textColor = .white
        return lable
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let webView: WKWebView={
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints=false
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(webView)
        view.addSubview(titleLable)
        view.addSubview(overviewLable)
        view.addSubview(downloadButton)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)

        ]
        let TitleLableConstraints = [
            titleLable.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
        ]
        let OverviewLableConstraints = [
            overviewLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 20),
            overviewLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ]
        let DownloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLable.bottomAnchor, constant: 20),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(TitleLableConstraints)
        NSLayoutConstraint.activate(OverviewLableConstraints)
        NSLayoutConstraint.activate(DownloadButtonConstraints)
    }
    
    func configure(with model: TitlePreviewViewModel){
        titleLable.text = model.title
        overviewLable.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else{return}
        
        webView.load(URLRequest(url: url))
        
    }
    

}
