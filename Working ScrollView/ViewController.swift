//
//  ViewController.swift
//  Working ScrollView
//
//  Created by Marlon Raschid Tavarez Parra on 15/3/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var card:[String] = []
    var views:[UIView] = []
    var currentOfSet = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        card.append("Card 1")
        card.append("Card 2")
        card.append("Card 2")
        card.append("Card 2")
        card.append("Card 2")
        //scrollView.backgroundColor = .red
        scrollView.clipsToBounds = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contendWidth:CGFloat = 0.0
        
        for x in 0...card.count {
            let cardView = UIView()
            cardView.layer.cornerRadius = 5
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height))
            let image = UIImage(named:"image_card")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            cardView.addSubview(imageView)
            
            cardView.frame = CGRect(x: contendWidth + 5, y: 0, width: self.view.frame.size.width - 110, height: 250)
            self.views.append(cardView)
            scrollView.addSubview(cardView)
            contendWidth += self.view.frame.size.width - 100

        }
        scrollView.contentSize = CGSize(width: contendWidth, height: self.scrollView.frame.size.height)
            views[1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        
        let pageWidth = scrollView.frame.size.width
        let fractionalPage = scrollView.contentOffset.x / pageWidth
        var  page = Int(fractionalPage.rounded())
        
        if page < 0 {
            page = 0
        }else if page == self.views.count {
            page = self.views.count - 1
        }
        
        
        if page == 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.views[page].transform = .identity
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.views[page + 1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
        }else  {
            UIView.animate(withDuration: 0.2, animations: {
                self.views[page].transform = .identity
            })
            
            UIView.animate(withDuration: 0.2, animations: {
                self.views[page - 1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
            
            if page == views.count - 1 {
                
            }else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.views[page + 1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
        }
        
        print(page)
        
    }
    
}

