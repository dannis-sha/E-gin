import UIKit
@IBDesignable
class TextFieldstroke: UITextField {
	override func draw(_ rect: CGRect){
//		let textColor = self.textColor
//		let c  = UIGraphicsGetCurrentContext()!
//
//		c.setLineWidth(2)
//		c.setLineJoin(.round)
//		c.setTextDrawingMode(.stroke)
//
//		self.textColor = UIColor.red
//		super.drawText(in: rect)
//
//		c.setTextDrawingMode(.fill)
//		self.textColor = textColor
//		super.drawText(in: rect)

        let path = UIBezierPath()
        let w = 0.1
        let bw = CGFloat(w)
        let bbw = bounds.width - 2*bw
        let bbh = bounds.height - 2*bw
        path.lineWidth = 1.0
        path.move(to: CGPoint(x:bw,y:bw))
        path.addLine(to: CGPoint(x:bbw+bw,y:bw))
        path.addLine(to: CGPoint(x:bbw+bw,y:bbh+bw))
        path.addLine(to: CGPoint(x:bw,y:bbh+bw))
        path.addLine(to: CGPoint(x:bw,y:bw))
        
        UIColor.red.setStroke()
        path.stroke()
	}
}
