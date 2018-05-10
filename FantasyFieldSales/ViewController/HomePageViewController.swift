//
//  PageViewController.swift
//  Diageo
//
//  Created by Clive Brown on 08/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

class HomePageViewIndexController: UIViewController {
    var index: Int = 0
}


class HomePageViewController: UIPageViewController {

    var orderedViewControllers: [()->HomePageViewIndexController] = {
        return [{ UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OneViewController") as! OneViewController },
                { UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController  }]
        
    }()

    
    var currentPage = 0
    var pageControl = UIPageControl()
    var transitionInProgress: Bool = false

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
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController()], direction: .forward, animated: true, completion: nil)
        }
        
        configurePageControl()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0,y: 50, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
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
        
        
        guard let currentViewController = self.viewControllers?.first as? HomePageViewIndexController else {
            return
        }
        
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else {
            return
        }
        
        if !transitionInProgress {
            transitionInProgress = true
            self.setViewControllers([nextViewController], direction: .forward, animated: true, completion: {(_ finished: Bool) -> Void in
                self.transitionInProgress = false
                self.pageControl.currentPage = currentViewController.index + 1
            })
        }
    }
    
   
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
        return orderedViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewController = pageViewController.viewControllers?.first as? HomePageViewIndexController {
            self.pageControl.currentPage = viewController.index
        }
    }
    
    
}


// MARK: UIPageViewControllerDataSource

extension HomePageViewController: UIPageViewControllerDataSource {

    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = (viewController as? HomePageViewIndexController)?.index else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            //return orderedViewControllers.last!()
            return nil
            
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        if !transitionInProgress {
            let vc = orderedViewControllers[previousIndex]()
            vc.index = previousIndex
            return vc
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = (viewController as? HomePageViewIndexController)?.index else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            //return orderedViewControllers.first!()
            return nil
        }
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        if !transitionInProgress {
            let vc = orderedViewControllers[nextIndex]()
            vc.index = nextIndex
            
            return vc
        }
        
        return nil

    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    

}


