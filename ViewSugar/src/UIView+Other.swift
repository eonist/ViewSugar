#if os(iOS)
import UIKit.UIView
/**
 * Other
 */
public extension UIView{
   /**
    * Creates UIImage from a view
    */
   public var snapShot:UIImage? {
      UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
      self.drawHierarchy(in: self.frame, afterScreenUpdates: true)
      let image:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return image
   }
   /**
    * Returns rotation of view
    */
   public var rotation:CGFloat {
      let radians = atan2(self.transform.b, self.transform.a)
      let degrees = radians * 180 / .pi
      return degrees
   }
   /**
    * NOTE: this method gives you the scale regardless of rotation or translation applied to transform:
    * REF: https://stackoverflow.com/a/46223255/5389500
    */
   public var scale:CGFloat {
      return sqrt(self.transform.a * self.transform.a + self.transform.c * self.transform.c)
   }
}
#endif
