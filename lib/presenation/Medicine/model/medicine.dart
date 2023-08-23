class Medicine {
  Medicine({
    required this.productNdc,
    required this.genericName,
    required this.labelerName,
    required this.brandName,
    required this.activeIngredients,
    required this.finished,
    required this.packaging,
    required this.listingExpirationDate,
    required this.openfda,
    required this.marketingCategory,
    required this.dosageForm,
    required this.splId,
    required this.productType,
    required this.route,
    required this.marketingStartDate,
    required this.productId,
    required this.applicationNumber,
    required this.brandNameBase,
    required this.pharmClass,
  });

  final String productNdc;
  final String genericName;
  final String labelerName;
  final String brandName;
  final List<ActiveIngredient> activeIngredients;
  final bool finished;
  final List<Packaging> packaging;
  final String listingExpirationDate;
  final Openfda? openfda;
  final String marketingCategory;
  final String dosageForm;
  final String splId;
  final String productType;
  final List<String> route;
  final String marketingStartDate;
  final String productId;
  final String applicationNumber;
  final String brandNameBase;
  final List<String> pharmClass;

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      productNdc: json["product_ndc"] ?? "",
      genericName: json["generic_name"] ?? "",
      labelerName: json["labeler_name"] ?? "",
      brandName: json["brand_name"] ?? "",
      activeIngredients: json["active_ingredients"] == null
          ? []
          : List<ActiveIngredient>.from(json["active_ingredients"]!
              .map((x) => ActiveIngredient.fromJson(x))),
      finished: json["finished"] ?? false,
      packaging: json["packaging"] == null
          ? []
          : List<Packaging>.from(
              json["packaging"]!.map((x) => Packaging.fromJson(x))),
      listingExpirationDate: json["listing_expiration_date"] ?? "",
      openfda:
          json["openfda"] == null ? null : Openfda.fromJson(json["openfda"]),
      marketingCategory: json["marketing_category"] ?? "",
      dosageForm: json["dosage_form"] ?? "",
      splId: json["spl_id"] ?? "",
      productType: json["product_type"] ?? "",
      route: json["route"] == null
          ? []
          : List<String>.from(json["route"]!.map((x) => x)),
      marketingStartDate: json["marketing_start_date"] ?? "",
      productId: json["product_id"] ?? "",
      applicationNumber: json["application_number"] ?? "",
      brandNameBase: json["brand_name_base"] ?? "",
      pharmClass: json["pharm_class"] == null
          ? []
          : List<String>.from(json["pharm_class"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return "$productNdc, $genericName, $labelerName, $brandName, $activeIngredients, $finished, $packaging, $listingExpirationDate, $openfda, $marketingCategory, $dosageForm, $splId, $productType, $route, $marketingStartDate, $productId, $applicationNumber, $brandNameBase, $pharmClass, ";
  }
}

class ActiveIngredient {
  ActiveIngredient({
    required this.name,
    required this.strength,
  });

  final String name;
  final String strength;

  factory ActiveIngredient.fromJson(Map<String, dynamic> json) {
    return ActiveIngredient(
      name: json["name"] ?? "",
      strength: json["strength"] ?? "",
    );
  }

  @override
  String toString() {
    return "$name, $strength, ";
  }
}

class Openfda {
  Openfda({
    required this.manufacturerName,
    required this.rxcui,
    required this.splSetId,
    required this.isOriginalPackager,
    required this.nui,
    required this.pharmClassMoa,
    required this.pharmClassCs,
    required this.pharmClassEpc,
    required this.unii,
  });

  final List<String> manufacturerName;
  final List<String> rxcui;
  final List<String> splSetId;
  final List<bool> isOriginalPackager;
  final List<String> nui;
  final List<String> pharmClassMoa;
  final List<String> pharmClassCs;
  final List<String> pharmClassEpc;
  final List<String> unii;

  factory Openfda.fromJson(Map<String, dynamic> json) {
    return Openfda(
      manufacturerName: json["manufacturer_name"] == null
          ? []
          : List<String>.from(json["manufacturer_name"]!.map((x) => x)),
      rxcui: json["rxcui"] == null
          ? []
          : List<String>.from(json["rxcui"]!.map((x) => x)),
      splSetId: json["spl_set_id"] == null
          ? []
          : List<String>.from(json["spl_set_id"]!.map((x) => x)),
      isOriginalPackager: json["is_original_packager"] == null
          ? []
          : List<bool>.from(json["is_original_packager"]!.map((x) => x)),
      nui: json["nui"] == null
          ? []
          : List<String>.from(json["nui"]!.map((x) => x)),
      pharmClassMoa: json["pharm_class_moa"] == null
          ? []
          : List<String>.from(json["pharm_class_moa"]!.map((x) => x)),
      pharmClassCs: json["pharm_class_cs"] == null
          ? []
          : List<String>.from(json["pharm_class_cs"]!.map((x) => x)),
      pharmClassEpc: json["pharm_class_epc"] == null
          ? []
          : List<String>.from(json["pharm_class_epc"]!.map((x) => x)),
      unii: json["unii"] == null
          ? []
          : List<String>.from(json["unii"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return "$manufacturerName, $rxcui, $splSetId, $isOriginalPackager, $nui, $pharmClassMoa, $pharmClassCs, $pharmClassEpc, $unii, ";
  }
}

class Packaging {
  Packaging({
    required this.packageNdc,
    required this.description,
    required this.marketingStartDate,
    required this.sample,
  });

  final String packageNdc;
  final String description;
  final String marketingStartDate;
  final bool sample;

  factory Packaging.fromJson(Map<String, dynamic> json) {
    return Packaging(
      packageNdc: json["package_ndc"] ?? "",
      description: json["description"] ?? "",
      marketingStartDate: json["marketing_start_date"] ?? "",
      sample: json["sample"] ?? false,
    );
  }

  @override
  String toString() {
    return "$packageNdc, $description, $marketingStartDate, $sample, ";
  }
}

/*
[
	{
		"product_ndc": "66715-9733",
		"generic_name": "Ibuprofen and Diphenhydramine citrate",
		"labeler_name": "Lil' Drug Store Products, Inc.",
		"brand_name": "Advil PM",
		"active_ingredients": [
			{
				"name": "DIPHENHYDRAMINE CITRATE",
				"strength": "38 mg/1"
			},
			{
				"name": "IBUPROFEN",
				"strength": "200 mg/1"
			}
		],
		"finished": true,
		"packaging": [
			{
				"package_ndc": "66715-9733-2",
				"description": "2 POUCH in 1 CARTON (66715-9733-2)  / 2 TABLET, COATED in 1 POUCH",
				"marketing_start_date": "20100511",
				"sample": false
			},
			{
				"package_ndc": "66715-9733-3",
				"description": "3 POUCH in 1 CARTON (66715-9733-3)  / 2 TABLET, COATED in 1 POUCH",
				"marketing_start_date": "20180214",
				"sample": false
			}
		],
		"listing_expiration_date": "20231231",
		"openfda": {
			"manufacturer_name": [
				"Lil' Drug Store Products, Inc."
			],
			"rxcui": [
				"895664"
			],
			"spl_set_id": [
				"b876bb40-a38b-445a-bc8a-466b3bfe166d"
			],
			"is_original_packager": [
				true
			],
			"nui": [
				"N0000000160",
				"M0001335",
				"N0000175722"
			],
			"pharm_class_moa": [
				"Cyclooxygenase Inhibitors [MoA]"
			],
			"pharm_class_cs": [
				"Anti-Inflammatory Agents, Non-Steroidal [CS]"
			],
			"pharm_class_epc": [
				"Nonsteroidal Anti-inflammatory Drug [EPC]"
			],
			"unii": [
				"4OD433S209",
				"WK2XYI10QM"
			]
		},
		"marketing_category": "NDA",
		"dosage_form": "TABLET, COATED",
		"spl_id": "ee15d4ba-f2a6-f9ce-e053-2a95a90a244f",
		"product_type": "HUMAN OTC DRUG",
		"route": [
			"ORAL"
		],
		"marketing_start_date": "20100511",
		"product_id": "66715-9733_ee15d4ba-f2a6-f9ce-e053-2a95a90a244f",
		"application_number": "NDA021394",
		"brand_name_base": "Advil PM",
		"pharm_class": [
			"Anti-Inflammatory Agents",
			"Non-Steroidal [CS]",
			"Cyclooxygenase Inhibitors [MoA]",
			"Histamine H1 Receptor Antagonists [MoA]",
			"Histamine-1 Receptor Antagonist [EPC]",
			"Nonsteroidal Anti-inflammatory Drug [EPC]"
		]
	}
]*/