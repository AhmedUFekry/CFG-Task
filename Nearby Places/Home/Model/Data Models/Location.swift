import Foundation
struct Location : Codable {
	let address : String?
	let lat : Double?
	let lng : Double?
	let labeledLatLngs : [LabeledLatLngs]?
	let distance : Int?
	let postalCode : String?
	let cc : String?
	let city : String?
	let state : String?
	let country : String?
	let formattedAddress : [String]?

	enum CodingKeys: String, CodingKey {

		case address = "address"
		case lat = "lat"
		case lng = "lng"
		case labeledLatLngs = "labeledLatLngs"
		case distance = "distance"
		case postalCode = "postalCode"
		case cc = "cc"
		case city = "city"
		case state = "state"
		case country = "country"
		case formattedAddress = "formattedAddress"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		labeledLatLngs = try values.decodeIfPresent([LabeledLatLngs].self, forKey: .labeledLatLngs)
		distance = try values.decodeIfPresent(Int.self, forKey: .distance)
		postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
		cc = try values.decodeIfPresent(String.self, forKey: .cc)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		formattedAddress = try values.decodeIfPresent([String].self, forKey: .formattedAddress)
	}

}
