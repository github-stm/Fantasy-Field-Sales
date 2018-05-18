//
//  PageViewController.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

protocol HomePageViewControllerDelegate {

    func homeNewsTapped()
  
}



class HomePageViewController: UIPageViewController {
    
    var delegateHomePageViewController: HomePageViewControllerDelegate?

    var currentPage = 0
    var pageControl = UIPageControl()
    var transitionInProgress: Bool = false
    
    
    var contentController:ContentViewController?
    var contentControllers: [ContentViewController]?
    

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]?) {
        // Default PageViewController transitionStyle to Scroll mode.
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self

        if Constants.backgroundColorContent.count > 0 {
            contentController = getContentViewController(withIndex: 0)
            contentControllers = [contentController] as? [ContentViewController]
            
            setViewControllers(contentControllers, direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0,y: 50, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = Constants.backgroundColorContent.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = .black
        self.pageControl.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 9.0, *) {
            self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
            self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
            self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        
        if let delegate = self.delegateHomePageViewController {
            delegate.homeNewsTapped()
            
        }
        
        guard let currentViewController = self.viewControllers?.first as? ContentViewController else {
            return
        }
        
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else {
            return
        }
        
        
        if !transitionInProgress {
            transitionInProgress = true
            self.setViewControllers([nextViewController], direction: .forward, animated: true, completion: {(_ finished: Bool) -> Void in
                self.transitionInProgress = false
                self.pageControl.currentPage = currentViewController.itemIndex + 1
            })
        }
    }
    
   
    
    
    func getContentViewController(withIndex index:Int) -> ContentViewController? {
     
        let contentVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        
            contentVC.itemIndex = index
            contentVC.bckgrdColor = Constants.backgroundColorContent[index]
            return contentVC
    }

}



extension HomePageViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if !transitionInProgress {
            return true
        }
        
        return false
    }
}


extension HomePageViewController: UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return Constants.backgroundColorContent.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewController = pageViewController.viewControllers?.first as? ContentViewController {
            self.pageControl.currentPage = viewController.itemIndex
        }
    }
   
}


// MARK: UIPageViewControllerDataSource

extension HomePageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let contentVC = viewController as! ContentViewController
        
        if contentVC.itemIndex > 0 {
            return getContentViewController(withIndex: contentVC.itemIndex - 1)
        }
        return nil
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        let contentVC = viewController as! ContentViewController
        
        if contentVC.itemIndex + 1 < Constants.backgroundColorContent.count {
            return getContentViewController(withIndex: contentVC.itemIndex + 1)
        }
        
        
        return nil
        
    }
    
   
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return Constants.backgroundColorContent.count
    }
    

}


