//
//  HomeViewController.swift
//  Weedy
//
//  Created by MAC on 15/08/20.
//  Copyright © 2020 Salace. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableview: UICollectionView!
    
    let profileButton : UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width:30, height:30))
        button.tintColor = .white
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    let cartButton : UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width:30, height:30))
        button.tintColor = .white
        button.setImage(UIImage(named: "cart"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    var circleAnimator: CircleAnimator?
    var selectedButton = UIView()
    
    override
    func viewDidLoad() {
        homeTableview.register(UINib(nibName: "MissCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MissCollectionViewCell")
        homeTableview.delegate = self
        homeTableview.dataSource = self
        
        if let layout = homeTableview?.collectionViewLayout as? MosiacHeight {
            layout.delegate = self
        }
        homeTableview.alpha = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.homeTableview.doAnimation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.homeTableview.alpha = 0
    }
    
    func setNavigationBar() {
        
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Weedy"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont(name: "Rockwell-Bold" , size: 40)! ]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont(name: "Rockwell-Bold" , size: 22)! ]
        
        self.navigationController?.navigationBar.barTintColor = .white //UIColor(named: "PColor")
        
        let profileChatView = UIView(frame: CGRect(x:0, y:0, width:20, height:30))
        profileChatView.addSubview(profileButton)
        profileButton.addTarget(self, action: #selector(tappedOnProfile), for: .touchUpInside)
        
        let cartView = UIView(frame: CGRect(x:0, y:0, width:20, height:30))
        cartView.addSubview(cartButton)
        
        let profileBB = UIBarButtonItem(customView: profileChatView)
        let cartBB = UIBarButtonItem(customView: cartView)
        
        self.navigationItem.leftBarButtonItem = profileBB
        self.navigationItem.rightBarButtonItems = [cartBB]
    }
    
    @objc
    func tappedOnProfile(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
//        if sender.isSelected {
//            let lay = UICollectionViewFlowLayout()
//            lay.itemSize = CGSize(width: ((self.homeTableview.frame.size.width / 2) - 8), height: (self.view.frame.size.width / 2))
//            lay.scrollDirection = .vertical
//            self.homeTableview.collectionViewLayout = lay
//            self.homeTableview.doAnimation()
//        } else {
//            let lay = UICollectionViewFlowLayout()
//            lay.itemSize = CGSize(width: ((self.homeTableview.frame.size.width) - 8), height: (self.view.frame.size.width / 3))
//            lay.scrollDirection = .vertical
//            self.homeTableview.collectionViewLayout = lay
//            self.homeTableview.doAnimation()
//        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            let cell = homeTableview.dequeueReusableCell(withReuseIdentifier: "MissCollectionViewCell", for: indexPath) as! MissCollectionViewCell
            
            return cell
        } else {
            let cell = homeTableview.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedButton = (collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell)?.contentView.subviews.first ?? UIView()
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        // self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: MosiacHeightDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if indexPath.item == 1 {
            return (((collectionView.frame.width / 2) * 1.5) / 4)
        } else {
            return (collectionView.frame.width / 2) * 1.3
        }
    }
}


extension UICollectionView {
    func doAnimation() {
        self.alpha = 0
        for cells in self.visibleCells {
            cells.alpha = 0
        }
        
        var timer = 0
        self.alpha = 1
        for cell in self.visibleCells.reversed() {
            UIView.animate(withDuration: 0.8, delay: Double(timer) * 0.3, options: .curveEaseInOut, animations: {
                cell.alpha = 1
            })
            timer += 1
        }
    }
}
