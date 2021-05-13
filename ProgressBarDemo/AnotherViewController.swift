//
//  AnotherViewController.swift
//  ProgressBarDemo
//
//  Created by vivek shrivastwa on 13/05/21.
//

import UIKit

class AnotherViewController: UIViewController {

    var startAngle = CGFloat(-Double.pi / 2)
    var IncAngle =  CGFloat((12 * Double.pi / 180) )
    var endAngle:CGFloat = 0
    
    @IBOutlet weak var counterLabel:UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private func makeCircularProgressBar(){
        let circle = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

            circle.layoutIfNeeded()

            var progressCircle = CAShapeLayer()

            let centerPoint = CGPoint (x: circle.bounds.width / 2, y: circle.bounds.width / 2)
            let circleRadius : CGFloat = circle.bounds.width / 2 * 0.83

            let circlePath = UIBezierPath(arcCenter: centerPoint,
                                          radius: circleRadius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true    )

            progressCircle = CAShapeLayer ()
            progressCircle.path = circlePath.cgPath
            progressCircle.strokeColor = UIColor.systemBlue.cgColor
            progressCircle.fillColor = UIColor.clear.cgColor
            progressCircle.lineWidth = 10
            progressCircle.strokeStart = 0
            progressCircle.strokeEnd = 1.0
             circle.layer.addSublayer(progressCircle)


            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1.0
        animation.duration = 0.5
        animation.fillMode = CAMediaTimingFillMode.forwards
            animation.isRemovedOnCompletion = false
             progressCircle.add(animation, forKey: "ani")

            self.view.addSubview(circle)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        //startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI)
        endAngle = startAngle + IncAngle
        makeCircularProgressBar()
        startAngle += IncAngle
        
        count = count + 1
        counterLabel.text = "\(count)"
    }
}
