// swift-tools-version:5.5

 import PackageDescription

 let package = Package(
     name: "ServiceSDK-iOS",
     products: [
         .library(
             name: "ServiceCases",
             targets: [
                 "ServiceCases",
                 "ServiceCore",
             ]
         ),
         .library(
             name: "ServiceChat",
             targets: [
                 "ServiceChat",
                 "ServiceCore",
             ]
         ),
         .library(
             name: "ServiceKnowledge",
             targets: [
                 "ServiceKnowledge",
                 "ServiceCore",
             ]
         ),
     ],
     targets: [
         .binaryTarget(
             name: "ServiceCore",
             url: "https://github.com/mthole/ServiceSDK-iOS/releases/download/234.1.0-SPM/ServiceCore.xcframework.zip",
             checksum: "cc06c8d3bd9f0063abbc6dab3715b7b76ce1c006665dd85c290b671f3412076f"
         ),
         .binaryTarget(
             name: "ServiceCases",
             url: "https://github.com/mthole/ServiceSDK-iOS/releases/download/234.1.0-SPM/ServiceCases.xcframework.zip",
             checksum: "67e28be204fb8bbf59d641a16be42d9f5ace26af6b2a88b2d7e195a0cf9da6f5"
         ),
         .binaryTarget(
             name: "ServiceChat",
             url: "https://github.com/mthole/ServiceSDK-iOS/releases/download/234.1.0-SPM/ServiceChat.xcframework.zip",
             checksum: "daac0d947015c3dd83ebfa26b830e1a3e5ca25bc254ec8e9994de90ec4fd4510"
         ),
         .binaryTarget(
             name: "ServiceKnowledge",
             url: "https://github.com/mthole/ServiceSDK-iOS/releases/download/234.1.0-SPM/ServiceKnowledge.xcframework.zip",
             checksum: "7548032a22b1512f3dc9f9db7eb4c5582e4670474c7f4da96258c98ce8735532"
         ),
     ]
 )
