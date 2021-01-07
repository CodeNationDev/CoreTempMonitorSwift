//
import Foundation
public struct CpuInfo: Codable {
    public var uiLoad: [Int]?
    public var uiTjMax: [Int]?
    public var uiCoreCnt: Int?
    public var uiCPUCnt: Int?
    public var fTemp: [Int]?
    public var fVID: Float?
    public var fCPUSpeed: Float?
    public var fFSBSpeed: Float?
    public var fMultiplier: Int?
    public var CPUName: String?
    public var ucFahrenheit: Int?
    public var ucDeltaToTjMax: Int?
    public var ucTdpSupported: Int?
    public var ucPowerSupported: Int?
    public var uiStructVersion: Int?
    public var  uiTdp: [Int]?
    public var fPower: [Float]?
    public var fMultipliers: [Int]?
}

public struct MemoryInfo: Codable {
    public var TotalPhys: Int64?
    public var FreePhys: Int64?
    public var TotalPage: Int64?
    public var FreePage: Int64?
    public var TotalVirtual: Int64?
    public var FreeVirtual: Int64?
    public var FreeExtendedVirtual: Int?
    public var MemoryLoad: Int?
}

public struct CoreTempObject: Codable {
    public var CpuInfo: CpuInfo?
    public var MemoryInfo: MemoryInfo?
}
