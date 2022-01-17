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
            url: "https://dfc-data-production.s3.amazonaws.com/files/service_sdk_ios/234.1.0/ServiceCore-234.1.0.zip",
            checksum: ""
        ),
        .binaryTarget(
            name: "ServiceCases",
            url: "https://dfc-data-production.s3.amazonaws.com/files/service_sdk_ios/234.1.0/ServiceCases-234.1.0.zip",
            checksum: ""
        ),
        .binaryTarget(
            name: "ServiceChat",
            url: "https://dfc-data-production.s3.amazonaws.com/files/service_sdk_ios/234.1.0/ServiceChat-234.1.0.zip",
            checksum: ""
        ),
        .binaryTarget(
            name: "ServiceKnowledge",
            url: "https://dfc-data-production.s3.amazonaws.com/files/service_sdk_ios/234.1.0/ServiceKnowledge-234.1.0.zip",
            checksum: ""
        ),
    ]
)
