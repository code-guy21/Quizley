//
//  CircularTransition.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/9/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

class CircularTransition: UIStoryboardSegue, UIViewControllerAnimatedTransitioning {
    
    func animate(firstVCView:UIView,
                 secondVCView:UIView,
                 containerView:UIView,
                 transitionContext: UIViewControllerContextTransitioning?) {
        
        // Get the screen width and height.
        let offset = secondVCView.bounds.width
        
        // Specify the initial position of the destination view.
        secondVCView.frame = secondVCView.frame.offsetBy(dx: offset, dy: 0.0)
        
        firstVCView.superview!.addSubview(secondVCView)
        secondVCView.alpha = 0;
        
        // Animate the transition.
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext!),
                                   animations: { () -> Void in
                                    firstVCView.frame = firstVCView.frame.offsetBy(dx: -offset, dy: 0.0)
                                    secondVCView.frame = secondVCView.frame.offsetBy(dx: -offset, dy: 0.0)
                                    secondVCView.alpha = 1; // emphasis
                                    
        }) { (Finished) -> Void in
            if let context = transitionContext {
                context.completeTransition(!context.transitionWasCancelled)
            } else {
                self.source.present(
                    self.destination ,
                    animated: false,
                    completion:nil)
            }
        }
    }
    
    var circle = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.3
    
    enum CircularTransitionMode:Int {
        case present, dismiss, pop
    }
    
    var transitionMode: CircularTransitionMode = .present

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
            
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to){
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                circle = UIView()
                
                circle.frame = frameForCircle(withViewCenter: viewCenter, vSize: viewSize, start: startingPoint)
                circle.center = startingPoint
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    
                }, completion: { (success:Bool) in
                    transitionContext.completeTransition(success)
                })
                
                
            }
        }
        else {
            if let returningView = transitionContext.view(forKey: UITransitionContextViewKey.from){
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                circle.frame = frameForCircle(withViewCenter: viewCenter, vSize: viewSize, start: startingPoint)
                
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                }, completion: { (success:Bool) in
                    returningView.center = viewCenter
                    returningView.removeFromSuperview()
                    
                    self.circle.removeFromSuperview()
                    
                    transitionContext.completeTransition(success)
                })
            }

        }
    
    }
    
    
    override func perform() {
        self.animate(firstVCView: self.source.view!,
                     secondVCView: self.destination.view!,
                     containerView: self.source.view!.superview!,
                     transitionContext:nil)
    }
}

    func frameForCircle ( withViewCenter viewCenter:CGPoint, vSize:CGSize, start:CGPoint) -> CGRect {
        let lengthX = fmax(start.x, vSize.width - start.x)
        let lengthY = fmax(start.y, vSize.height - start.y)
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2
        let size = CGSize(width: offset, height: offset)
        
        return CGRect(origin: CGPoint.zero , size: size)
    }
