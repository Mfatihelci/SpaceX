//
//  Model.swift
//  SpaceXApplication
//
//  Created by fatih on 16.07.2022.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let flightNumber: Int?
    let missionName: String?
    let missionID: [String]?
    let upcoming: Bool?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: TentativeMaxPrecision?
    let tbd: Bool?
    let launchWindow: Int?
    let rocket: Rocket?
    let ships: [String]?
    let telemetry: Telemetry?
    let reuse: Reuse?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: Links?
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let timeline: [String: Int?]?
    let lastDateUpdate: String?
    let lastLlLaunchDate, lastLlUpdate: String?
    let lastWikiLaunchDate, lastWikiRevision, lastWikiUpdate: String?
    let launchDateSource: LaunchDateSource?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, ships, telemetry, reuse
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case launchFailureDetails = "launch_failure_details"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline
        case lastDateUpdate = "last_date_update"
        case lastLlLaunchDate = "last_ll_launch_date"
        case lastLlUpdate = "last_ll_update"
        case lastWikiLaunchDate = "last_wiki_launch_date"
        case lastWikiRevision = "last_wiki_revision"
        case lastWikiUpdate = "last_wiki_update"
        case launchDateSource = "launch_date_source"
    }
}

enum LaunchDateSource: String, Codable {
    case launchLibrary = "launch_library"
    case wiki = "wiki"
}

// MARK: - LaunchFailureDetails
struct LaunchFailureDetails: Codable {
    let time: Int?
    let altitude: Int?
    let reason: String?
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let siteID: SiteID?
    let siteName: SiteName?
    let siteNameLong: SiteNameLong?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

enum SiteID: String, Codable {
    case ccafsSlc40 = "ccafs_slc_40"
    case kscLc39A = "ksc_lc_39a"
    case kwajaleinAtoll = "kwajalein_atoll"
    case vafbSlc4E = "vafb_slc_4e"
}

enum SiteName: String, Codable {
    case ccafsSlc40 = "CCAFS SLC 40"
    case kscLc39A = "KSC LC 39A"
    case kwajaleinAtoll = "Kwajalein Atoll"
    case vafbSlc4E = "VAFB SLC 4E"
}

enum SiteNameLong: String, Codable {
    case capeCanaveralAirForceStationSpaceLaunchComplex40 = "Cape Canaveral Air Force Station Space Launch Complex 40"
    case kennedySpaceCenterHistoricLaunchComplex39A = "Kennedy Space Center Historic Launch Complex 39A"
    case kwajaleinAtollOmelekIsland = "Kwajalein Atoll Omelek Island"
    case vandenbergAirForceBaseSpaceLaunchComplex4E = "Vandenberg Air Force Base Space Launch Complex 4E"
}

// MARK: - Links
struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    let redditCampaign: String?
    let redditLaunch: String?
    let redditRecovery, redditMedia: String?
    let presskit: String?
    let articleLink: String?
    let wikipedia: String?
    let videoLink: String?
    let youtubeID: String?
    let flickrImages: [String]?

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case presskit
        case articleLink = "article_link"
        case wikipedia
        case videoLink = "video_link"
        case youtubeID = "youtube_id"
        case flickrImages = "flickr_images"
    }
}

// MARK: - Reuse
struct Reuse: Codable {
    let core, sideCore1, sideCore2, fairings: Bool?
    let capsule: Bool?

    enum CodingKeys: String, CodingKey {
        case core
        case sideCore1 = "side_core1"
        case sideCore2 = "side_core2"
        case fairings, capsule
    }
}

// MARK: - Rocket
struct Rocket: Codable {
    let rocketID: RocketID?
    let rocketName: RocketName?
    let rocketType: RocketType?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let fairings: Fairings?

    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ship: Ship?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ship
    }
}

enum Ship: String, Codable {
    case gomschief = "GOMSCHIEF"
    case gomstree = "GOMSTREE"
    case gosearcher = "GOSEARCHER"
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let cores: [Core]?
}

// MARK: - Core
struct Core: Codable {
    let coreSerial: String?
    let flight: Int?
    let block: Int?
    let gridfins, legs, reused: Bool?
    let landSuccess: Bool?
    let landingIntent: Bool?
    let landingType: LandingType?
    let landingVehicle: LandingVehicle?

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, gridfins, legs, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

enum LandingVehicle: String, Codable {
    case jrti = "JRTI"
    case jrti1 = "JRTI-1"
    case lz1 = "LZ-1"
    case lz2 = "LZ-2"
    case lz4 = "LZ-4"
    case ocisly = "OCISLY"
}

enum RocketID: String, Codable {
    case falcon1 = "falcon1"
    case falcon9 = "falcon9"
    case falconheavy = "falconheavy"
}

enum RocketName: String, Codable {
    case falcon1 = "Falcon 1"
    case falcon9 = "Falcon 9"
    case falconHeavy = "Falcon Heavy"
}

enum RocketType: String, Codable {
    case ft = "FT"
    case merlinA = "Merlin A"
    case merlinC = "Merlin C"
    case v10 = "v1.0"
    case v11 = "v1.1"
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let block: Int?
    let payloads: [Payload]?
}

// MARK: - Payload
struct Payload: Codable {
    let payloadID: String?
    let noradID: [Int]?
    let reused: Bool?
    let customers: [String]?
    let nationality: String?
    let manufacturer: String?
    let payloadType: PayloadType?
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String?
    let orbitParams: OrbitParams?
    let capSerial: String?
    let massReturnedKg, massReturnedLbs: Double?
    let flightTimeSEC: Int?
    let cargoManifest: String?
    let uid: String?

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
        case capSerial = "cap_serial"
        case massReturnedKg = "mass_returned_kg"
        case massReturnedLbs = "mass_returned_lbs"
        case flightTimeSEC = "flight_time_sec"
        case cargoManifest = "cargo_manifest"
        case uid
    }
}

// MARK: - OrbitParams
struct OrbitParams: Codable {
    let referenceSystem: ReferenceSystem?
    let regime: Regime?
    let longitude, semiMajorAxisKM, eccentricity, periapsisKM: Double?
    let apoapsisKM, inclinationDeg, periodMin, lifespanYears: Double?
    let epoch: String?
    let meanMotion, raan, argOfPericenter, meanAnomaly: Double?

    enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case regime, longitude
        case semiMajorAxisKM = "semi_major_axis_km"
        case eccentricity
        case periapsisKM = "periapsis_km"
        case apoapsisKM = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
        case periodMin = "period_min"
        case lifespanYears = "lifespan_years"
        case epoch
        case meanMotion = "mean_motion"
        case raan
        case argOfPericenter = "arg_of_pericenter"
        case meanAnomaly = "mean_anomaly"
    }
}

enum ReferenceSystem: String, Codable {
    case geocentric = "geocentric"
    case heliocentric = "heliocentric"
    case highlyElliptical = "highly-elliptical"
}

enum Regime: String, Codable {
    case geostationary = "geostationary"
    case geosynchronous = "geosynchronous"
    case highEarth = "high-earth"
    case highlyElliptical = "highly-elliptical"
    case l1Point = "L1-point"
    case lowEarth = "low-earth"
    case mediumEarth = "medium-earth"
    case semiSynchronous = "semi-synchronous"
    case subOrbital = "sub-orbital"
    case sunSynchronous = "sun-synchronous"
    case veryLowEarth = "very-low-earth"
}

enum PayloadType: String, Codable {
    case crewDragon = "Crew Dragon"
    case dragon10 = "Dragon 1.0"
    case dragon11 = "Dragon 1.1"
    case dragonBoilerplate = "Dragon Boilerplate"
    case lander = "Lander"
    case satellite = "Satellite"
}

// MARK: - Telemetry
struct Telemetry: Codable {
    let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}

enum TentativeMaxPrecision: String, Codable {
    case hour = "hour"
}




