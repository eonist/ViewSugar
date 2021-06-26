#if os(OSX)
import Cocoa

public class DepthParser {
   /**
    * Returns the front most view
    * - Fixme: ⚠️️ make this T where T is NSView etc
    */
   public static func frontMostView(views: [NSView]) -> NSView? {
      views.sorted { $0.superview?.subviews.firstIndex(of: $0) ?? 0 > $1.superview?.subviews.firstIndex(of: $1) ?? 0 }.min
   }
   /**
    * Return the front most view
    * - Fixme: ⚠️️ make this T where T is NSView etc
    */
   public static func frontMostView(parent: NSView) -> NSView? {
      DepthParser.frontMostView(views: parent.subviews)
   }
}
#endif
