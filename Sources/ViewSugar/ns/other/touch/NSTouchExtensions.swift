#if os(OSX)
import Cocoa

extension NSTouch {
   /**
    * Returns the relative position of the touch to the view
    * - NOTE: the normalizedTouch is the relative location on the trackpad. values range from 0-1. And are y-flipped
    * - Fixme: ⚠️️ debug if the touch area is working with a rect with a green stroke
    */
   func pos(_ view: NSView) -> CGPoint {
      let w = view.frame.size.width
      let h = view.frame.size.height
      let touchPos: CGPoint = .init(x: self.normalizedPosition.x, y: 1 + (self.normalizedPosition.y * -1))/*flip the touch coordinates*/
      let deviceSize: CGSize = self.deviceSize
      let deviceRatio: CGFloat = deviceSize.width / deviceSize.height /*find the ratio of the device*/
      let viewRatio: CGFloat = w / h
      var touchArea: CGSize = .init(width: w, height: h)
      /*Unifor-shrink the device to the view frame*/
      if deviceRatio > viewRatio {/*device is wider than view*/
         touchArea.height = h / viewRatio
         touchArea.width = w
      }else if deviceRatio < viewRatio {/*view is wider than device*/
         touchArea.height = h
         touchArea.width = w / deviceRatio
      }/*else ratios are the same*/
      let touchAreaPos: CGPoint = .init(x: (w - touchArea.width) / 2, y: (h - touchArea.height) / 2)/*we center the touchArea to the View*/
      return CGPoint(x: (touchPos.x * touchArea.width) + touchAreaPos.x, y: (touchPos.y * touchArea.height) + touchAreaPos.y)
   }
}
extension NSTouch.Phase {
   /**
    * Great when logging phaseType
    * - Fixme: Would it be possible to return .began.rawValue instead?
    * - Fixme: Also use switch here
    */
   var type: String {
      if self == .began {
         return "began"
      } else if self ==  .moved {
         return "moved"
      } else if self ==  .stationary {
         return "stationary"
      } else if self ==  .ended {
         return "ended"
      } else if self ==  .cancelled {
         return "cancelled"
      } else if self ==  .touching {
         return "touching"
      } else {
         return "no match"
      }
   }
}
/**
 * - Fixme: ⚠️️ Would it be possible to return .began.rawValue instead?
 */
extension NSEvent.Phase {
   var type: String {
      if self == .began {
         return "began"
      } else if self == .stationary {
         return "stationary"
      } else if self == .changed {
         return "changed"
      } else if self == .ended {
         return "ended"
      } else if self == .cancelled {
         return "cancelled"
      } else if self == .mayBegin {
         return "mayBegin"
      } else {
         return "no match"
      }
   }
}
#endif
