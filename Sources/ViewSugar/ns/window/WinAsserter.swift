#if os(OSX)
import Cocoa

class WinAsserter {
   /**
    * Asserts if a win of PARAM: type exists
    */
   static func hasWindowOfType<T>(_ type: T.Type) -> Bool {
      WinParser.windowsOfType(type).isEmpty == false
   }
}

#endif
