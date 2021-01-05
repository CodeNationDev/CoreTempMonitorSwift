# CoreTempMonitorSwift
> A simple API for read AlCPU CoreTemp data to make your own Monitor App for iOS, macOS, watchOS or tvOS.

## Installation
Use Swift Package Manager to add this package to your project.

## Definition & Interface
```swift
public convenience init(ip: String, port: String , using: NWParameters)
```
- ip (String): endpoint of machine where CoreTempServer is running.
- port (String): the port number where CoreTempServer is publishing the data.
- using (NWParameters): enumerated that defines the protocol to read data.

## Entities
All data info has been strcutured in following objects
```swift
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
```
Use each one for design your monitor.

## Usage example
### Initialize
Object instance runs the socket read. If you want to stop the reading call stop() function directly.
```swift
//
import UIKit
import CoreTempMonitorSwift

class ViewController: UIViewController {
    let sManager = SocketManager(ip: "192.168.1.69", port: "5200", using: .tcp)
    override func viewDidLoad() {
        super.viewDidLoad()
        sManager.delegate = self
    }
    @IBAction func stop_tapped(_ sender: Any) {
        sManager.stop()
    }
}

extension ViewController: CoreTempMonitorSwiftDelegate {
    func didReadData(data: CoreTempObject) {
        //do something
    }
}
```


## Meta

David Martin Saiz – [@deividmarshall](https://twitter.com/deividmarshall) – davms81@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/CodeNationDev/](https://github.com/CodeNationDev)

## Version History
* 0.0.1
    * First implementation with main features.
