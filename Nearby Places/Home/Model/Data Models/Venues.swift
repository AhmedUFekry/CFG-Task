import Foundation
struct Venues : Codable {
	let id : String?
	let name : String?
	let location : Location?
	let categories : [Categories]?
	let createdAt : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case location = "location"
		case categories = "categories"
		case createdAt = "createdAt"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
		createdAt = try values.decodeIfPresent(Int.self, forKey: .createdAt)
	}

}
