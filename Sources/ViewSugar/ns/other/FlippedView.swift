#if os(OSX)
import Cocoa

class FlippedView: NSView {
    override var isFlipped: Bool { true } /*Organizes your view from top to bottom, for mac*/
}
#endif
