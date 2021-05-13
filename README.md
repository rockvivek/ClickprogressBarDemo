# ClickprogressBarDemo
##This is a circular progress bar that increases 3.34 % in on click

###the circular progress bar is made using the UIView and UIBezierPath by defining its radius, startpoint, endpoint, arccenter and rotation direction

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

### add circular progress cycle using CAShapeLayer

            progressCircle = CAShapeLayer ()
            progressCircle.path = circlePath.cgPath
            progressCircle.strokeColor = UIColor.systemBlue.cgColor
            progressCircle.fillColor = UIColor.clear.cgColor
            progressCircle.lineWidth = 10
            progressCircle.strokeStart = 0
            progressCircle.strokeEnd = 1.0
             circle.layer.addSublayer(progressCircle)

### animate the progress bar

          let animation = CABasicAnimation(keyPath: "strokeEnd")
          animation.fromValue = 0
          animation.toValue = 1.0
          animation.duration = 0.5
          animation.fillMode = CAMediaTimingFillMode.forwards
          animation.isRemovedOnCompletion = false
          progressCircle.add(animation, forKey: "ani")
          self.view.addSubview(circle)
