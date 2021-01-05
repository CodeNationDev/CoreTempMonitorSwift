//
import Foundation
struct CpuInfo: Codable {
    var uiLoad: [Int]?
    var uiTjMax: [Int]?
    var uiCoreCnt: Int?
    var uiCPUCnt: Int?
    var fTemp: [Int]?
    var fVID: Float?
    var fCPUSpeed: Float?
    var fFSBSpeed: Float?
    var fMultiplier: Int?
    var CPUName: String?
    var ucFahrenheit: Int?
    var ucDeltaToTjMax: Int?
    var ucTdpSupported: Int?
    var ucPowerSupported: Int?
    var uiStructVersion: Int?
    var  uiTdp: [Int]?
    var fPower: [Float]?
    var fMultipliers: [Int]?
}

struct MemoryInfo: Codable {
    var TotalPhys: Int64?
    var FreePhys: Int64?
    var TotalPage: Int64?
    var FreePage: Int64?
    var TotalVirtual: Int64?
    var FreeVirtual: Int64?
    var FreeExtendedVirtual: Int?
    var MemoryLoad: Int?
}

public struct CoreTempObject: Codable {
    var CpuInfo: CpuInfo?
    var MemoryInfo: MemoryInfo?
}
