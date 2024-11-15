import Foundation
struct LabeledLatLngs : Codable {
	let label : String?
	let lat : Double?
	let lng : Double?

	enum CodingKeys: String, CodingKey {

		case label = "label"
		case lat = "lat"
		case lng = "lng"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
	}

}
