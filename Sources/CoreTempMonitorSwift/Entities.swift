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

struct CoreTempObject: Codable {
    var CpuInfo: CpuInfo?
    var MemoryInfo: MemoryInfo?
}


let json =
"""
{
    "CpuInfo": {
        "uiLoad": [2, 14],
        "uiTjMax": [100],
        "uiCoreCnt": 2,
        "uiCPUCnt": 1,
        "fTemp": [29, 32],
        "fVID": 1.11352539,
        "fCPUSpeed": 3702.701,
        "fFSBSpeed": 100.073,
        "fMultiplier": 37,
        "CPUName": "Intel Core i3 6100 (Skylake) ",
        "ucFahrenheit": 0,
        "ucDeltaToTjMax": 0,
        "ucTdpSupported": 1,
        "ucPowerSupported": 1,
        "uiStructVersion": 2,
        "uiTdp": [65],
        "fPower": [16.9173222],
        "fMultipliers": [37, 37]
    },
    "MemoryInfo": {
        "TotalPhys": 8145,
        "FreePhys": 5378,
        "TotalPage": 10008,
        "FreePage": 4941,
        "TotalVirtual": 134217728,
        "FreeVirtual": 134212948,
        "FreeExtendedVirtual": 1,
        "MemoryLoad": 33
    }
}
"""
