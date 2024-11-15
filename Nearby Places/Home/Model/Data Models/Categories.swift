import Foundation
struct Categories : Codable {
	let id : String?
	let name : String?
	let pluralName : String?
	let shortName : String?
	let icon : Icon?
	let categoryCode : Int?
	let mapIcon : String?
	let primary : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case pluralName = "pluralName"
		case shortName = "shortName"
		case icon = "icon"
		case categoryCode = "categoryCode"
		case mapIcon = "mapIcon"
		case primary = "primary"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		pluralName = try values.decodeIfPresent(String.self, forKey: .pluralName)
		shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
		icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
		categoryCode = try values.decodeIfPresent(Int.self, forKey: .categoryCode)
		mapIcon = try values.decodeIfPresent(String.self, forKey: .mapIcon)
		primary = try values.decodeIfPresent(Bool.self, forKey: .primary)
	}

}
