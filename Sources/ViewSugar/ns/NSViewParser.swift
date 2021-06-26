#if os(OSX)
import Cocoa

class NSViewParser {
   /**
    * Returns an array of all the children in PARAM: view that is of type PARAM: classType
    * - Note: this works with classes and protocols
    * - Important: ⚠️️ Remember to use: IA.self and A.self as the type
    * - Fixme: ⚠️️ rename to childrenByClassType, maybe not?, I say not!
    */
   static func childrenOfType<T>(_ view: NSView, _ type: T.Type? = nil) -> [T] {
      view.subviews.compactMap { $0 as? T }
   }
   /**
    * Returns a list of parents
    */
   static func parents(_ view: NSView) -> [NSView] {
      var parents: [NSView] = []
      var parent: NSView? = view.superview // :Fixme: seperate this into a check if its DO then that, if its Window then do that
      while parent != nil { // loops up the object hierarchy as long as the parent is a Element supertype
         parents.insert(parent!, at: 0) // was        _ = ArrayModifier.unshift(&parents, parent!)
         parent = parent!.superview
      }
      return parents
   }
   /**
    * - Fixme: ⚠️️ should this return nil instead of -1? its easier to debug if it returns nil
    */
   static func indexOf(_ view: NSView, _ subView: NSView) -> Int {
      view.subviews.firstIndex { $0 === subView } ?? -1
   }
   /**
    * Returns the index of PARAM: subView in PARAM: view, -1 if no match is found
    */
   static func getSubViewAt(_ view: NSView, _ at: Int) -> NSView? {
      view.subviews.count < at ? view.subviews[at] : nil //  was return view.subviews[safe:at]
   }
   /**
    * Returns the first parent of PARAM: view that is of type PARAM: classType
    * NOTE: this method is recursive, and looks through parents of parents and so on until it finds a match for the classType
    */
   static func parentOfType<T>(_ view: NSView, _ classType: T.Type) -> T? {
      if let superView = view.superview {
         if superView as? T != nil { // Fixme ⚠️️ this should be == nil
            return parentOfType(superView, classType)
         }
         return superView as? T
      }
      return nil
   }
   /**
    * Returns the array index of PARAM: item from PARAM: parent
    * - Note: this function is recursive
    * - Fixme: ⚠️️ Rename to indexMap? or depth or map?, since index should be index of a NSView, maybe idx3d?
    * ## Examples:
    * index(self,subSubSubChild)
    */
   static func index(_ parent: NSView, _ child: NSView) -> [Int]? {
      if parent === child { return [] }
      else if !parent.subviews.isEmpty {
         for (i, view) in parent.subviews.enumerated() {
            let match: [Int]? = !view.subviews.isEmpty ? index(view, child) : nil
            if match != nil { return [i] + match! }
         }
      }
      return nil
   }
   /**
    * New
    * Update: Swift 4.2
    */
   static func first<T>(view: NSView, ofKind: T.Type? = nil) -> T? {
      view.subviews.lazy.compactMap { $0 as? T }.first
   }
}
#endif
//DEPRECATED
//static func getSubviewAt(_ view:NSView, _ i:Int)->NSView{return view.subviews[i]}/*favour getSubViewAt method instead, as its optional*/
