import Clibxmp
import Foundation

public struct XMPModuleInfo {
  public let md5: String
  public let volumeBase: Int32
  public let module: XMPModule
  public let comment: String?
  public let numberOfSequences: Int32
  public let sequenceData: XMPSequenceData

  init(_ xmp_module_info: xmp_module_info) {
    self.md5 = withUnsafePointer(to: xmp_module_info.md5) {
      $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: $0)) {
        String(cString: $0)
      }
    }

    self.volumeBase = xmp_module_info.vol_base
    self.module = XMPModule(xmp_module_info.mod.pointee)
    if xmp_module_info.comment != nil {
      self.comment = String(cString: xmp_module_info.comment)
    } else {
      self.comment = nil
    }
    self.numberOfSequences = xmp_module_info.num_sequences
    self.sequenceData = XMPSequenceData(xmp_module_info.seq_data.pointee)
  }
}
