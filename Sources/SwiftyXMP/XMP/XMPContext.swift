import Foundation
import Clibxmp

public struct XMPContext {
  public var xmp_context: xmp_context
}

extension XMPContext {
  static func initFromXMPContext(_ xmp_context: xmp_context) -> XMPContext {
    XMPContext(xmp_context: xmp_context)
  }
}
