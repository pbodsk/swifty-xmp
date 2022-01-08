import Clibxmp
import Foundation

public struct XMPSequenceData {
  public let entryPoint: Int32
  public let duration: Int32

  init(_ xmp_sequence: xmp_sequence) {
    self.entryPoint = xmp_sequence.entry_point
    self.duration = xmp_sequence.duration
  }
}
