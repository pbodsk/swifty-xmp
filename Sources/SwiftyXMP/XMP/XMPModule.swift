import Clibxmp
import Foundation

public struct XMPModule {
  public let name: String
  public let type: StringLiteralType
  public let numberOfPatterns: Int32
  public let numberOfTracks: Int32
  public let tracksPerPattern: Int32
  public let numberOfInstruments: Int32
  public let numberOfSamples: Int32
  public let initialSpeed: Int32
  public let initialBPM: Int32
  public let lengthInPatterns: Int32
  public let restartPosition: Int32
  public let globalVolume: Int32

  init(_ xmp_module: xmp_module) {
    self.name = withUnsafePointer(to: xmp_module.name) {
      $0.withMemoryRebound(to: CChar.self, capacity: MemoryLayout.size(ofValue: $0)) {
        String(cString: $0)
      }
    }
    self.type = withUnsafePointer(to: xmp_module.type) {
      $0.withMemoryRebound(to: CChar.self, capacity: MemoryLayout.size(ofValue: $0)) {
        String(cString: $0)
      }
    }
    self.numberOfPatterns = xmp_module.pat
    self.numberOfTracks = xmp_module.trk
    self.tracksPerPattern = xmp_module.chn
    self.numberOfInstruments = xmp_module.ins
    self.numberOfSamples = xmp_module.smp
    self.initialSpeed = xmp_module.spd
    self.initialBPM = xmp_module.bpm
    self.lengthInPatterns = xmp_module.len
    self.restartPosition = xmp_module.rst
    self.globalVolume = xmp_module.gvl
  }

/*
  public var xxp: UnsafeMutablePointer<UnsafeMutablePointer<xmp_pattern>?>! /* Patterns */

  public var xxt: UnsafeMutablePointer<UnsafeMutablePointer<xmp_track>?>! /* Tracks */

  public var xxi: UnsafeMutablePointer<xmp_instrument>! /* Instruments */

  public var xxs: UnsafeMutablePointer<xmp_sample>! /* Samples */

  public var xxc: (xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel, xmp_channel) /* Channel info */

  public var xxo: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) /* Orders */
*/
}
