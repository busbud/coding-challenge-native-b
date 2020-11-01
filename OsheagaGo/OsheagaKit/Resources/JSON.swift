
import Foundation

struct JSON {

    static let departures = """
        {
        \"origin_city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
        \"destination_city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
        \"cities\": [
        {
          \"id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"region_id\": 3361,
          \"name\": \"Quebec City\",
          \"lat\": 46.81228,
          \"lon\": -71.21454,
          \"geohash\": \"f2m673\",
          \"timezone\": \"America/Montreal\",
          \"image_url\": null,
          \"hero_image_url\": \"https://busbud.imgix.net/city-heroes/quebec.jpg?h={height}&w={width}&auto=format\",
          \"legacy_url_form\": \"Quebec,Quebec,Canada\",
          \"country_code2\": \"CA\",
          \"full_name\": \"Quebec City, Quebec, Canada\",
          \"short_name\": \"Quebec City, QC, Canada\",
          \"locale\": \"en\",
          \"region\": {
            \"id\": 3361,
            \"region_code\": \"QC\",
            \"country_code2\": \"CA\",
            \"name\": \"Quebec\",
            \"short_name\": \"QC\",
            \"locale\": \"en\",
            \"country\": {
              \"code2\": \"CA\",
              \"code3\": \"CAN\",
              \"name\": \"Canada\",
              \"short_name\": \"Canada\",
              \"continent\": \"NA\",
              \"default_locale\": \"en\",
              \"default_currency\": \"CAD\",
              \"population\": 33679000,
              \"locale\": \"en\"
            }
          }
        },
        {
          \"id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"region_id\": 3361,
          \"name\": \"Montreal\",
          \"lat\": 45.50884,
          \"lon\": -73.58781,
          \"geohash\": \"f25dvk\",
          \"timezone\": \"America/Montreal\",
          \"image_url\": \"https://busbud.imgix.net/city-hires/1474307214311-Montreal,Quebec,Canada.jpg?h={height}&w={width}&auto=format,compress\",
          \"hero_image_url\": \"https://busbud.imgix.net/city-heroes/montreal.jpg?h={height}&w={width}&auto=format\",
          \"legacy_url_form\": \"Montreal,Quebec,Canada\",
          \"country_code2\": \"CA\",
          \"full_name\": \"Montreal, Quebec, Canada\",
          \"short_name\": \"Montreal, QC, Canada\",
          \"locale\": \"en\",
          \"region\": {
            \"id\": 3361,
            \"region_code\": \"QC\",
            \"country_code2\": \"CA\",
            \"name\": \"Quebec\",
            \"short_name\": \"QC\",
            \"locale\": \"en\",
            \"country\": {
              \"code2\": \"CA\",
              \"code3\": \"CAN\",
              \"name\": \"Canada\",
              \"short_name\": \"Canada\",
              \"continent\": \"NA\",
              \"default_locale\": \"en\",
              \"default_currency\": \"CAD\",
              \"population\": 33679000,
              \"locale\": \"en\"
            }
          }
        }
        ],
        \"locations\": [
        {
          \"id\": 17529,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Aéroport YUL\",
          \"address\": [
            \"Aéroport Montréal-Trudeau, H4Y 1H1, Dorval, Québec\"
          ],
          \"type\": \"airport\",
          \"lat\": 45.45764,
          \"lon\": -73.7497,
          \"geohash\": \"f25d9g31g\"
        },
        {
          \"id\": 3970,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Place Bonaventure\",
          \"address\": [
            \"Place Bonaventure\",
            \"Montréal, QC\",
            \"Canada\"
          ],
          \"type\": \"transit_station\",
          \"lat\": 45.4988273060484,
          \"lon\": -73.5644745826722,
          \"geohash\": \"f25dvfzcz\"
        },
        {
          \"id\": 12159,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Université Laval\",
          \"address\": [
            \"2325 Rue de la vie Étudiante\",
            \"G1V 0A6, Québec, QC\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 46.7786169142382,
          \"lon\": -71.2689757347107,
          \"geohash\": \"f2m645z90\"
        },
        {
          \"id\": 24108,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"René-Lévesque & Jeanne-Mance\",
          \"address\": [
            \"220 Boulevard René-Lévesque O\",
            \"Montréal\",
            \"QC H5B, Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5063360495651,
          \"lon\": -73.5635840171967,
          \"geohash\": \"f25dyh0ts\"
        },
        {
          \"id\": 17505,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Gare Centrale\",
          \"address\": [
            \"895 Rue de la Gauchetière O\",
            \"Montréal\",
            \"QC H3B 4G1, Canada\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 45.499918,
          \"lon\": -73.566459,
          \"geohash\": \"f25dvgn81\"
        },
        {
          \"id\": 12186,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Aéroport YUL\",
          \"address\": [
            \"Roméo-Vachon Blvd North (Departures)\",
            \"Dorval, QC H4Y 1G8\",
            \"Canada\"
          ],
          \"type\": \"airport\",
          \"lat\": 45.4576547718173,
          \"lon\": -73.7496221065521,
          \"geohash\": \"f25d9g34j\"
        },
        {
          \"id\": 25180,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Crémazie\",
          \"address\": [
            \"401 Rue Berri\",
            \"Montréal, QC H2M\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5456615477858,
          \"lon\": -73.6389907876969,
          \"geohash\": \"f25eh73dx\"
        },
        {
          \"id\": 17525,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Jean-Talon\",
          \"address\": [
            \"7160 Rue Saint-Denis\",
            \"Montréal, QC H2R 2E2\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5382699406975,
          \"lon\": -73.6146678134918,
          \"geohash\": \"f25ehcgrt\"
        },
        {
          \"id\": 1938,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Gare d'autocars\",
          \"address\": [
            \"1717 Rue Berri\",
            \"Montréal, QC H2L 4E9\",
            \"Canada\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 45.516235,
          \"lon\": -73.562668,
          \"geohash\": \"f25dyjcr3\"
        },
        {
          \"id\": 17508,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Saint-Denis & Saint-Joseph\",
          \"address\": [
            \"389 Boulevard Saint-Joseph Est\",
            \"Montréal, QC H2T 1J5\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5262379894414,
          \"lon\": -73.5881536441803,
          \"geohash\": \"f25dvry9x\"
        },
        {
          \"id\": 17511,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"René-Lévesque & Robert-Bourassa\",
          \"address\": [
            \"645 Boulevard René-Lévesque O\",
            \"Montréal, QC H3B 1S5\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5021298156559,
          \"lon\": -73.5673371779098,
          \"geohash\": \"f25dvgmvh\"
        },
        {
          \"id\": 8602,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Gare d'autocars\",
          \"address\": [
            \"3001 Chemin des Quatre Bourgeois\",
            \"Ville de Québec\",
            \"QC G1V 5A6, Canada\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 46.772798,
          \"lon\": -71.30157,
          \"geohash\": \"f2m616xz2\"
        },
        {
          \"id\": 54315,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"AUTEUIL\",
          \"address\": [],
          \"type\": \"other\",
          \"lat\": 45.619,
          \"lon\": -73.676,
          \"geohash\": \"f25ee2wvb\"
        },
        {
          \"id\": 54316,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"AUTEUIL\",
          \"address\": [],
          \"type\": \"other\",
          \"lat\": 45.619,
          \"lon\": -73.676,
          \"geohash\": \"f25ee2wvb\"
        },
        {
          \"id\": 24112,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Robert-Bourassa & René-Lévesque\",
          \"address\": [
            \"800 Boulevard Robert-Bourassa\",
            \"Montréal, QC H3B\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5019518197437,
          \"lon\": -73.5671702027321,
          \"geohash\": \"f25dvgqh0\"
        },
        {
          \"id\": 34714,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Musée des Beaux-Arts\",
          \"address\": [
            \"188 Grande Allée Ouest\",
            \"Ville de Québec, QC G1R 2G9\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 46.801207,
          \"lon\": -71.225462,
          \"geohash\": \"f2m65pzhy\"
        },
        {
          \"id\": 36020,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"120 PLACE CHARLES LEMOYNE\",
          \"address\": [],
          \"type\": \"other\",
          \"lat\": 45.253,
          \"lon\": -73.522,
          \"geohash\": \"f259qyncv\"
        },
        {
          \"id\": 65796,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Montréal (Aéroport Trudeau - YUL)\",
          \"address\": [],
          \"type\": \"other\",
          \"lat\": null,
          \"lon\": null,
          \"geohash\": null
        },
        {
          \"id\": 25179,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Radisson\",
          \"address\": [
            \"7200 Rue Sherbrooke E\",
            \"Montréal, QC H1N 1E7\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.5888,
          \"lon\": -73.53948,
          \"geohash\": \"f25eqe4nj\"
        },
        {
          \"id\": 12189,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Gare du Palais\",
          \"address\": [
            \"320 Rue Abraham Martin\",
            \"Québec, QC G1K 3X2\",
            \"Canada\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 46.8189915,
          \"lon\": -71.2143053,
          \"geohash\": \"f2m677pk6\"
        },
        {
          \"id\": 24134,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Terminus Mansfield\",
          \"address\": [
            \"243 Rue Mansfield, Boarding Area 6\",
            \"Montréal\",
            \"QC H3C, Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.4978168765594,
          \"lon\": -73.5640573795537,
          \"geohash\": \"f25dy487c\"
        },
        {
          \"id\": 25188,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Université Laval\",
          \"address\": [
            \"2325 Rue de la Vie-Étudiante\",
            \"Ville de Québec, QC G1V\",
            \"Canada\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 46.7783995,
          \"lon\": -71.2685248,
          \"geohash\": \"f2m645xzg\"
        },
        {
          \"id\": 5160,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Gare d'autocars\",
          \"address\": [
            \"1717 Rue Berri\",
            \"Montreal, QC H2L 4E9\"
          ],
          \"type\": \"bus_station\",
          \"lat\": 45.516235,
          \"lon\": -73.562668,
          \"geohash\": \"f25dyjcr3\"
        },
        {
          \"id\": 17530,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"René-Lévesque & St Urbain\",
          \"address\": [
            \"200 Boulevard René-Lévesque O\",
            \"Montréal\",
            \"QC H2Z 1X4\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.507147,
          \"lon\": -73.56292,
          \"geohash\": \"f25dyh347\"
        },
        {
          \"id\": 12166,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Radisson\",
          \"address\": [
            \"7155 Rue Sherbrooke E, quai 5\",
            \"Montréal, QC H1N\"
          ],
          \"type\": \"subway_station\",
          \"lat\": 45.58889,
          \"lon\": -73.53987,
          \"geohash\": \"f25eqe1ys\"
        },
        {
          \"id\": 52191,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Dorion\",
          \"address\": [
            \"205 Boulevard Harwood\",
            \"Vaudreuil-Dorion\",
            \"QC J7V 1Y3\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.383,
          \"lon\": -74.014,
          \"geohash\": \"f2565v8xh\"
        },
        {
          \"id\": 47056,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Centre infotourisme\",
          \"address\": [
            \"12 Rue Sainte-Anne\",
            \"Québec, QC G1R 3X2\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 46.8130864,
          \"lon\": -71.2055932,
          \"geohash\": \"f2m67dj9v\"
        },
        {
          \"id\": 17519,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Laurier Québec\",
          \"address\": [
            \"Laurier Québec\",
            \"Ville de Québec\",
            \"QC G1V, Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 46.7698740269924,
          \"lon\": -71.283801775116,
          \"geohash\": \"f2m61fhwr\"
        },
        {
          \"id\": 54328,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Longueuil - Métro\",
          \"address\": [
            \"120 Place Charles-Le Moyne\",
            \"Longueuil\",
            \"QC J4K 2T4\",
            \"Canada\"
          ],
          \"type\": \"other\",
          \"lat\": 45.5242577,
          \"lon\": -73.5217692,
          \"geohash\": \"f25dyzrn4\"
        },
        {
          \"id\": 54317,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Laval - Cartier Métro\",
          \"address\": [
            \"Laval\",
            \"Laval\",
            \"QC H7N 0A3\",
            \"Canada\"
          ],
          \"type\": \"other\",
          \"lat\": 45.5603,
          \"lon\": -73.6817,
          \"geohash\": \"f25e5mfxg\"
        },
        {
          \"id\": 17514,
          \"city_id\": \"375dd587-9001-acbd-84a4-683deddcb1b1\",
          \"name\": \"Charest est & de la Couronne\",
          \"address\": [
            \"400 Boulevard Charest E\",
            \"Ville de Québec, QC G1K 3J1\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 46.8137578643147,
          \"lon\": -71.2240678134918,
          \"geohash\": \"f2m6760jy\"
        },
        {
          \"id\": 51843,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Gare Centrale\",
          \"address\": [
            \"800 Rue de la Gauchetière O\",
            \"Montréal, QC H5A 1K8\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.500133,
          \"lon\": -73.5652994,
          \"geohash\": \"f25dvgp3k\"
        },
        {
          \"id\": 35991,
          \"city_id\": \"375dd587-9001-acbd-84a4-683dedfb933e\",
          \"name\": \"Aéroport YUL\",
          \"address\": [
            \"975 Roméo-Vachon Blvd North (bus & taxi loop)\",
            \"Dorval, QC H4Y\",
            \"Canada\"
          ],
          \"type\": \"bus_stop\",
          \"lat\": 45.4568721045985,
          \"lon\": -73.7516283988953,
          \"geohash\": \"f25d9eptq\"
        }
        ],
        \"operators\": [
                {
                    \"id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"source_id\": 262,
                    \"profile_id\": 156,
                    \"name\": \"Orléans Express\",
                    \"url\": \"https://www.orleansexpress.com/\",
                    \"logo_url\": \"https://busbud.imgix.net/operator-logos/logo_orleans-express.png.png?h={height}&w={width}&auto=format&fit=fill&bg=0FFF\",
                    \"display_name\": \"Orléans Express\",
                    \"review_state\": \"good\",
                    \"sellable\": true,
                    \"fuzzy_prices\": false,
                    \"sell_tickets_cutoff\": {
                        \"minutes\": 5
                    },
                    \"amenities\": {
                        \"classes\": {
                            \"Economy\": {
                                \"display_name\": \"Economy\",
                                \"wifi\": false,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": true,
                                \"small_seat\": false,
                                \"average_seat\": true,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            },
                            \"FLEX\": {
                                \"display_name\": \"Flex\",
                                \"wifi\": false,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": true,
                                \"small_seat\": false,
                                \"average_seat\": true,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            },
                            \"PROMO\": {
                                \"display_name\": \"Promo\",
                                \"wifi\": false,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": true,
                                \"small_seat\": false,
                                \"average_seat\": true,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            },
                            \"PROMO+\": {
                                \"display_name\": \"Promo+\",
                                \"wifi\": false,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": true,
                                \"small_seat\": false,
                                \"average_seat\": true,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            },
                            \"Regular\": {
                                \"display_name\": \"Regular\",
                                \"wifi\": true,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": false,
                                \"small_seat\": false,
                                \"average_seat\": false,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            },
                            \"Standard\": {
                                \"display_name\": \"Standard\",
                                \"wifi\": false,
                                \"toilet\": true,
                                \"ac\": true,
                                \"refreshment\": false,
                                \"food\": false,
                                \"hot_meal\": false,
                                \"power_outlets\": true,
                                \"tv\": false,
                                \"bus_attendant\": false,
                                \"leg_room\": true,
                                \"small_seat\": false,
                                \"average_seat\": true,
                                \"xl_seat\": false,
                                \"full_recline_seat\": false,
                                \"carpool\": false
                            }
                        }
                    },
                    \"default_vehicle_type\": \"bus\",
                    \"source\": \"orleansexpress_api\",
                    \"referral_deal\": false,
                    \"referral_deal_type\": null,
                    \"display_url\": \"orleansexpress.com\",
                    \"fraud_check\": null
                }
            ],
        \"departures\": [
                {
                    \"amenities\": {
                        \"display_name\": \"Flex\",
                        \"wifi\": false,
                        \"toilet\": true,
                        \"ac\": true,
                        \"refreshment\": false,
                        \"food\": false,
                        \"hot_meal\": false,
                        \"power_outlets\": true,
                        \"tv\": false,
                        \"bus_attendant\": false,
                        \"leg_room\": true,
                        \"small_seat\": false,
                        \"average_seat\": true,
                        \"xl_seat\": false,
                        \"full_recline_seat\": false,
                        \"carpool\": false
                    },
                    \"arrival_timezone\": \"America/Montreal\",
                    \"available_seats\": 24,
                    \"vehicle\": null,
                    \"busbud_departure_id\": \"e706c803\",
                    \"class\": \"FLEX\",
                    \"class_name\": \"Flex\",
                    \"complete\": false,
                    \"contractor_name\": null,
                    \"fare_name\": null,
                    \"deeplink\": null,
                    \"departure_timezone\": \"America/Montreal\",
                    \"departure_type\": \"editable-refundable\",
                    \"destination_location_id\": 1938,
                    \"duration\": 195,
                    \"has_search_details\": false,
                    \"has_layout\": null,
                    \"has_transfers\": false,
                    \"has_addons\": null,
                    \"id\": \"ZTg5YWU3ZjQ6ZTcwNmM4MDM\",
                    \"links\": {
                        \"deeplink\": \"https://www.busbud.com/en/deeplink/f2m673/f25dvk/ZTg5YWU3ZjQ6ZTcwNmM4MDM?outbound_date=2020-11-25&return_date&adults=1&children=0&seniors=0&child_ages=&senior_ages=&discount_code&utm_source={utm_source}&utm_campaign={utm_campaign}&utm_medium={utm_medium}\"
                    },
                    \"num_transfers\": 0,
                    \"operator_id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"origin_location_id\": 12189,
                    \"passenger_questions\": [],
                    \"schedule_id\": null,
                    \"sellable\": true,
                    \"source_id\": 262,
                    \"ticket_types\": [
                        \"eticket\"
                    ],
                    \"departure_time\": \"2020-11-25T09:30:00\",
                    \"arrival_time\": \"2020-11-25T12:45:00\",
                    \"fetched_at\": \"2020-11-01T00:31:19.392Z\",
                    \"search_request_id\": \"202011011206354362d1067f1beea4694a22d1d510e21360c6fe3d8b246d80c492642a65242b\",
                    \"unreliable_duration\": null,
                    \"has_unmapped_location\": null,
                    \"data_source\": \"l2\",
                    \"cache_source\": \"departure-service\",
                    \"operator_disclaimers\": null,
                    \"vehicle_type\": \"bus\",
                    \"bus\": null,
                    \"has_bus_details\": null,
                    \"prices\": {
                        \"currency\": \"USD\",
                        \"total\": 5285,
                        \"categories\": {
                            \"adult\": 4517
                        },
                        \"discount\": 0,
                        \"roundtrip_min\": null,
                        \"roundtrip_min_fees_included\": null,
                        \"roundtrip_total\": null,
                        \"roundtrip_total_fees_included\": null,
                        \"discounted\": null,
                        \"breakdown\": {
                            \"base\": 4517,
                            \"fees\": 92,
                            \"taxes\": 677,
                            \"discount\": 0
                        }
                    },
                    \"trip_stops\": [
                        {
                            \"arrival_time\": null,
                            \"departure_time\": \"2020-11-25T09:30:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 12189,
                            \"name\": \"Québec (centre-ville)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T10:00:00\",
                            \"departure_time\": \"2020-11-25T10:00:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 17507,
                            \"name\": \"Québec (Sainte-Foy)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T12:45:00\",
                            \"departure_time\": null,
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 1938,
                            \"name\": \"Montréal (centre-ville)\",
                            \"transfer\": false
                        }
                    ],
                    \"addons\": [],
                    \"details\": {},
                    \"terms\": {
                        \"type_of_id\": \"photo_and_full_name\",
                        \"ticket_requirements\": {
                            \"eticket\": \"printed_or_mobile_tkt\"
                        },
                        \"nb_carry_on\": 1,
                        \"kg_by_carry_on\": null,
                        \"nb_checked_bags\": 2,
                        \"kg_by_bag\": 34,
                        \"checked_in_size_cm\": {
                            \"l\": 60,
                            \"w\": 60,
                            \"h\": 90
                        },
                        \"extra_checked_in_fees\": {
                            \"type\": \"per_extra_checked_in\",
                            \"amount\": 500
                        },
                        \"nb_extra_checked_in\": null,
                        \"total_checked_in_kg\": null,
                        \"oversized_luggage\": {
                            \"allowed\": true,
                            \"allowed_types\": [],
                            \"fees\": {
                                \"type\": \"flat_fee\",
                                \"amount\": 500
                            },
                            \"early_arrival_required\": true,
                            \"cover_required\": true
                        },
                        \"animals\": {
                            \"fees\": {
                                \"type\": \"unknown\",
                                \"amount\": null,
                                \"percent\": null
                            },
                            \"main_compartment_allowed\": false,
                            \"hold_compartment_allowed\": false,
                            \"main_max_weight_kg\": null,
                            \"main_small_cage_required\": null,
                            \"hold_max_weight_kg\": null,
                            \"vaccination_required\": true,
                            \"special_animals_allowed\": true,
                            \"early_arrival_required\": true,
                            \"specific_hours\": null
                        },
                        \"refund_policies\": [
                            {
                                \"type\": \"self-serve\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": 0.25,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"refund\": true,
                        \"refund_cutoff\": 1,
                        \"exchange_policies\": [
                            {
                                \"type\": \"station\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": null,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"exchange\": true,
                        \"exchange_cutoff\": 1,
                        \"exchange_cutoff_at\": \"2020-11-25T13:30:00.000Z\",
                        \"refund_cutoff_at\": \"2020-11-25T13:30:00.000Z\",
                        \"currency\": \"CAD\",
                        \"addons\": {},
                        \"piece_of_id\": true,
                        \"boarding_requirement\": \"printed_or_mobile_tkt\",
                        \"extra_bag_policy\": true,
                        \"extra_bag_cost\": 500,
                        \"extra_bag_kg_cost\": null,
                        \"bag_allowed\": true
                    }
                },
                {
                    \"amenities\": {
                        \"display_name\": \"Flex\",
                        \"wifi\": false,
                        \"toilet\": true,
                        \"ac\": true,
                        \"refreshment\": false,
                        \"food\": false,
                        \"hot_meal\": false,
                        \"power_outlets\": true,
                        \"tv\": false,
                        \"bus_attendant\": false,
                        \"leg_room\": true,
                        \"small_seat\": false,
                        \"average_seat\": true,
                        \"xl_seat\": false,
                        \"full_recline_seat\": false,
                        \"carpool\": false
                    },
                    \"arrival_timezone\": \"America/Montreal\",
                    \"available_seats\": 24,
                    \"vehicle\": null,
                    \"busbud_departure_id\": \"b2980ec8\",
                    \"class\": \"FLEX\",
                    \"class_name\": \"Flex\",
                    \"complete\": false,
                    \"contractor_name\": null,
                    \"fare_name\": null,
                    \"deeplink\": null,
                    \"departure_timezone\": \"America/Montreal\",
                    \"departure_type\": \"editable-refundable\",
                    \"destination_location_id\": 1938,
                    \"duration\": 225,
                    \"has_search_details\": false,
                    \"has_layout\": null,
                    \"has_transfers\": false,
                    \"has_addons\": null,
                    \"id\": \"ODY2MDUzYjpiMjk4MGVjOA\",
                    \"links\": {
                        \"deeplink\": \"https://www.busbud.com/en/deeplink/f2m673/f25dvk/ODY2MDUzYjpiMjk4MGVjOA?outbound_date=2020-11-25&return_date&adults=1&children=0&seniors=0&child_ages=&senior_ages=&discount_code&utm_source={utm_source}&utm_campaign={utm_campaign}&utm_medium={utm_medium}\"
                    },
                    \"num_transfers\": 0,
                    \"operator_id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"origin_location_id\": 12189,
                    \"passenger_questions\": [],
                    \"schedule_id\": null,
                    \"sellable\": true,
                    \"source_id\": 262,
                    \"ticket_types\": [
                        \"eticket\"
                    ],
                    \"departure_time\": \"2020-11-25T10:30:00\",
                    \"arrival_time\": \"2020-11-25T14:15:00\",
                    \"fetched_at\": \"2020-11-01T00:31:19.392Z\",
                    \"search_request_id\": \"202011011206354362d1067f1beea4694a22d1d510e21360c6fe3d8b246d80c492642a65242b\",
                    \"unreliable_duration\": null,
                    \"has_unmapped_location\": null,
                    \"data_source\": \"l2\",
                    \"cache_source\": \"departure-service\",
                    \"operator_disclaimers\": null,
                    \"vehicle_type\": \"bus\",
                    \"bus\": null,
                    \"has_bus_details\": null,
                    \"prices\": {
                        \"currency\": \"USD\",
                        \"total\": 5285,
                        \"categories\": {
                            \"adult\": 4517
                        },
                        \"discount\": 0,
                        \"roundtrip_min\": null,
                        \"roundtrip_min_fees_included\": null,
                        \"roundtrip_total\": null,
                        \"roundtrip_total_fees_included\": null,
                        \"discounted\": null,
                        \"breakdown\": {
                            \"base\": 4517,
                            \"fees\": 92,
                            \"taxes\": 677,
                            \"discount\": 0
                        }
                    },
                    \"trip_stops\": [
                        {
                            \"arrival_time\": null,
                            \"departure_time\": \"2020-11-25T10:30:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 12189,
                            \"name\": \"Québec (centre-ville)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T11:00:00\",
                            \"departure_time\": \"2020-11-25T11:00:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 17507,
                            \"name\": \"Québec (Sainte-Foy)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T12:15:00\",
                            \"departure_time\": \"2020-11-25T12:30:00\",
                            \"duration\": 15,
                            \"departure_operator_id\": null,
                            \"location_id\": 12187,
                            \"name\": \"Trois-Rivières\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T14:15:00\",
                            \"departure_time\": null,
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 1938,
                            \"name\": \"Montréal (centre-ville)\",
                            \"transfer\": false
                        }
                    ],
                    \"addons\": [],
                    \"details\": {},
                    \"terms\": {
                        \"type_of_id\": \"photo_and_full_name\",
                        \"ticket_requirements\": {
                            \"eticket\": \"printed_or_mobile_tkt\"
                        },
                        \"nb_carry_on\": 1,
                        \"kg_by_carry_on\": null,
                        \"nb_checked_bags\": 2,
                        \"kg_by_bag\": 34,
                        \"checked_in_size_cm\": {
                            \"l\": 60,
                            \"w\": 60,
                            \"h\": 90
                        },
                        \"extra_checked_in_fees\": {
                            \"type\": \"per_extra_checked_in\",
                            \"amount\": 500
                        },
                        \"nb_extra_checked_in\": null,
                        \"total_checked_in_kg\": null,
                        \"oversized_luggage\": {
                            \"allowed\": true,
                            \"allowed_types\": [],
                            \"fees\": {
                                \"type\": \"flat_fee\",
                                \"amount\": 500
                            },
                            \"early_arrival_required\": true,
                            \"cover_required\": true
                        },
                        \"animals\": {
                            \"fees\": {
                                \"type\": \"unknown\",
                                \"amount\": null,
                                \"percent\": null
                            },
                            \"main_compartment_allowed\": false,
                            \"hold_compartment_allowed\": false,
                            \"main_max_weight_kg\": null,
                            \"main_small_cage_required\": null,
                            \"hold_max_weight_kg\": null,
                            \"vaccination_required\": true,
                            \"special_animals_allowed\": true,
                            \"early_arrival_required\": true,
                            \"specific_hours\": null
                        },
                        \"refund_policies\": [
                            {
                                \"type\": \"self-serve\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": 0.25,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"refund\": true,
                        \"refund_cutoff\": 1,
                        \"exchange_policies\": [
                            {
                                \"type\": \"station\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": null,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"exchange\": true,
                        \"exchange_cutoff\": 1,
                        \"exchange_cutoff_at\": \"2020-11-25T14:30:00.000Z\",
                        \"refund_cutoff_at\": \"2020-11-25T14:30:00.000Z\",
                        \"currency\": \"CAD\",
                        \"addons\": {},
                        \"piece_of_id\": true,
                        \"boarding_requirement\": \"printed_or_mobile_tkt\",
                        \"extra_bag_policy\": true,
                        \"extra_bag_cost\": 500,
                        \"extra_bag_kg_cost\": null,
                        \"bag_allowed\": true
                    }
                },
                {
                    \"amenities\": {
                        \"display_name\": \"Flex\",
                        \"wifi\": false,
                        \"toilet\": true,
                        \"ac\": true,
                        \"refreshment\": false,
                        \"food\": false,
                        \"hot_meal\": false,
                        \"power_outlets\": true,
                        \"tv\": false,
                        \"bus_attendant\": false,
                        \"leg_room\": true,
                        \"small_seat\": false,
                        \"average_seat\": true,
                        \"xl_seat\": false,
                        \"full_recline_seat\": false,
                        \"carpool\": false
                    },
                    \"arrival_timezone\": \"America/Montreal\",
                    \"available_seats\": 24,
                    \"vehicle\": null,
                    \"busbud_departure_id\": \"cb8087ce\",
                    \"class\": \"FLEX\",
                    \"class_name\": \"Flex\",
                    \"complete\": false,
                    \"contractor_name\": null,
                    \"fare_name\": null,
                    \"deeplink\": null,
                    \"departure_timezone\": \"America/Montreal\",
                    \"departure_type\": \"editable-refundable\",
                    \"destination_location_id\": 1938,
                    \"duration\": 195,
                    \"has_search_details\": false,
                    \"has_layout\": null,
                    \"has_transfers\": false,
                    \"has_addons\": null,
                    \"id\": \"ODI4NjhhYjU6Y2I4MDg3Y2U\",
                    \"links\": {
                        \"deeplink\": \"https://www.busbud.com/en/deeplink/f2m673/f25dvk/ODI4NjhhYjU6Y2I4MDg3Y2U?outbound_date=2020-11-25&return_date&adults=1&children=0&seniors=0&child_ages=&senior_ages=&discount_code&utm_source={utm_source}&utm_campaign={utm_campaign}&utm_medium={utm_medium}\"
                    },
                    \"num_transfers\": 0,
                    \"operator_id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"origin_location_id\": 12189,
                    \"passenger_questions\": [],
                    \"schedule_id\": null,
                    \"sellable\": true,
                    \"source_id\": 262,
                    \"ticket_types\": [
                        \"eticket\"
                    ],
                    \"departure_time\": \"2020-11-25T12:30:00\",
                    \"arrival_time\": \"2020-11-25T15:45:00\",
                    \"fetched_at\": \"2020-11-01T00:31:19.392Z\",
                    \"search_request_id\": \"202011011206354362d1067f1beea4694a22d1d510e21360c6fe3d8b246d80c492642a65242b\",
                    \"unreliable_duration\": null,
                    \"has_unmapped_location\": null,
                    \"data_source\": \"l2\",
                    \"cache_source\": \"departure-service\",
                    \"operator_disclaimers\": null,
                    \"vehicle_type\": \"bus\",
                    \"bus\": null,
                    \"has_bus_details\": null,
                    \"prices\": {
                        \"currency\": \"USD\",
                        \"total\": 5285,
                        \"categories\": {
                            \"adult\": 4517
                        },
                        \"discount\": 0,
                        \"roundtrip_min\": null,
                        \"roundtrip_min_fees_included\": null,
                        \"roundtrip_total\": null,
                        \"roundtrip_total_fees_included\": null,
                        \"discounted\": null,
                        \"breakdown\": {
                            \"base\": 4517,
                            \"fees\": 92,
                            \"taxes\": 677,
                            \"discount\": 0
                        }
                    },
                    \"trip_stops\": [
                        {
                            \"arrival_time\": null,
                            \"departure_time\": \"2020-11-25T12:30:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 12189,
                            \"name\": \"Québec (centre-ville)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T13:00:00\",
                            \"departure_time\": \"2020-11-25T13:00:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 17507,
                            \"name\": \"Québec (Sainte-Foy)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T15:45:00\",
                            \"departure_time\": null,
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 1938,
                            \"name\": \"Montréal (centre-ville)\",
                            \"transfer\": false
                        }
                    ],
                    \"addons\": [],
                    \"details\": {},
                    \"terms\": {
                        \"type_of_id\": \"photo_and_full_name\",
                        \"ticket_requirements\": {
                            \"eticket\": \"printed_or_mobile_tkt\"
                        },
                        \"nb_carry_on\": 1,
                        \"kg_by_carry_on\": null,
                        \"nb_checked_bags\": 2,
                        \"kg_by_bag\": 34,
                        \"checked_in_size_cm\": {
                            \"l\": 60,
                            \"w\": 60,
                            \"h\": 90
                        },
                        \"extra_checked_in_fees\": {
                            \"type\": \"per_extra_checked_in\",
                            \"amount\": 500
                        },
                        \"nb_extra_checked_in\": null,
                        \"total_checked_in_kg\": null,
                        \"oversized_luggage\": {
                            \"allowed\": true,
                            \"allowed_types\": [],
                            \"fees\": {
                                \"type\": \"flat_fee\",
                                \"amount\": 500
                            },
                            \"early_arrival_required\": true,
                            \"cover_required\": true
                        },
                        \"animals\": {
                            \"fees\": {
                                \"type\": \"unknown\",
                                \"amount\": null,
                                \"percent\": null
                            },
                            \"main_compartment_allowed\": false,
                            \"hold_compartment_allowed\": false,
                            \"main_max_weight_kg\": null,
                            \"main_small_cage_required\": null,
                            \"hold_max_weight_kg\": null,
                            \"vaccination_required\": true,
                            \"special_animals_allowed\": true,
                            \"early_arrival_required\": true,
                            \"specific_hours\": null
                        },
                        \"refund_policies\": [
                            {
                                \"type\": \"self-serve\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": 0.25,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"refund\": true,
                        \"refund_cutoff\": 1,
                        \"exchange_policies\": [
                            {
                                \"type\": \"station\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": null,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"exchange\": true,
                        \"exchange_cutoff\": 1,
                        \"exchange_cutoff_at\": \"2020-11-25T16:30:00.000Z\",
                        \"refund_cutoff_at\": \"2020-11-25T16:30:00.000Z\",
                        \"currency\": \"CAD\",
                        \"addons\": {},
                        \"piece_of_id\": true,
                        \"boarding_requirement\": \"printed_or_mobile_tkt\",
                        \"extra_bag_policy\": true,
                        \"extra_bag_cost\": 500,
                        \"extra_bag_kg_cost\": null,
                        \"bag_allowed\": true
                    }
                },
                {
                    \"amenities\": {
                        \"display_name\": \"Flex\",
                        \"wifi\": false,
                        \"toilet\": true,
                        \"ac\": true,
                        \"refreshment\": false,
                        \"food\": false,
                        \"hot_meal\": false,
                        \"power_outlets\": true,
                        \"tv\": false,
                        \"bus_attendant\": false,
                        \"leg_room\": true,
                        \"small_seat\": false,
                        \"average_seat\": true,
                        \"xl_seat\": false,
                        \"full_recline_seat\": false,
                        \"carpool\": false
                    },
                    \"arrival_timezone\": \"America/Montreal\",
                    \"available_seats\": 24,
                    \"vehicle\": null,
                    \"busbud_departure_id\": \"e1054946\",
                    \"class\": \"FLEX\",
                    \"class_name\": \"Flex\",
                    \"complete\": false,
                    \"contractor_name\": null,
                    \"fare_name\": null,
                    \"deeplink\": null,
                    \"departure_timezone\": \"America/Montreal\",
                    \"departure_type\": \"editable-refundable\",
                    \"destination_location_id\": 1938,
                    \"duration\": 195,
                    \"has_search_details\": false,
                    \"has_layout\": null,
                    \"has_transfers\": false,
                    \"has_addons\": null,
                    \"id\": \"NGQwNTQ3MzplMTA1NDk0Ng\",
                    \"links\": {
                        \"deeplink\": \"https://www.busbud.com/en/deeplink/f2m673/f25dvk/NGQwNTQ3MzplMTA1NDk0Ng?outbound_date=2020-11-25&return_date&adults=1&children=0&seniors=0&child_ages=&senior_ages=&discount_code&utm_source={utm_source}&utm_campaign={utm_campaign}&utm_medium={utm_medium}\"
                    },
                    \"num_transfers\": 0,
                    \"operator_id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"origin_location_id\": 12189,
                    \"passenger_questions\": [],
                    \"schedule_id\": null,
                    \"sellable\": true,
                    \"source_id\": 262,
                    \"ticket_types\": [
                        \"eticket\"
                    ],
                    \"departure_time\": \"2020-11-25T16:30:00\",
                    \"arrival_time\": \"2020-11-25T19:45:00\",
                    \"fetched_at\": \"2020-11-01T00:31:19.392Z\",
                    \"search_request_id\": \"202011011206354362d1067f1beea4694a22d1d510e21360c6fe3d8b246d80c492642a65242b\",
                    \"unreliable_duration\": null,
                    \"has_unmapped_location\": null,
                    \"data_source\": \"l2\",
                    \"cache_source\": \"departure-service\",
                    \"operator_disclaimers\": null,
                    \"vehicle_type\": \"bus\",
                    \"bus\": null,
                    \"has_bus_details\": null,
                    \"prices\": {
                        \"currency\": \"USD\",
                        \"total\": 5285,
                        \"categories\": {
                            \"adult\": 4517
                        },
                        \"discount\": 0,
                        \"roundtrip_min\": null,
                        \"roundtrip_min_fees_included\": null,
                        \"roundtrip_total\": null,
                        \"roundtrip_total_fees_included\": null,
                        \"discounted\": null,
                        \"breakdown\": {
                            \"base\": 4517,
                            \"fees\": 92,
                            \"taxes\": 677,
                            \"discount\": 0
                        }
                    },
                    \"trip_stops\": [
                        {
                            \"arrival_time\": null,
                            \"departure_time\": \"2020-11-25T16:30:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 12189,
                            \"name\": \"Québec (centre-ville)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T17:00:00\",
                            \"departure_time\": \"2020-11-25T17:00:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 17507,
                            \"name\": \"Québec (Sainte-Foy)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T19:45:00\",
                            \"departure_time\": null,
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 1938,
                            \"name\": \"Montréal (centre-ville)\",
                            \"transfer\": false
                        }
                    ],
                    \"addons\": [],
                    \"details\": {},
                    \"terms\": {
                        \"type_of_id\": \"photo_and_full_name\",
                        \"ticket_requirements\": {
                            \"eticket\": \"printed_or_mobile_tkt\"
                        },
                        \"nb_carry_on\": 1,
                        \"kg_by_carry_on\": null,
                        \"nb_checked_bags\": 2,
                        \"kg_by_bag\": 34,
                        \"checked_in_size_cm\": {
                            \"l\": 60,
                            \"w\": 60,
                            \"h\": 90
                        },
                        \"extra_checked_in_fees\": {
                            \"type\": \"per_extra_checked_in\",
                            \"amount\": 500
                        },
                        \"nb_extra_checked_in\": null,
                        \"total_checked_in_kg\": null,
                        \"oversized_luggage\": {
                            \"allowed\": true,
                            \"allowed_types\": [],
                            \"fees\": {
                                \"type\": \"flat_fee\",
                                \"amount\": 500
                            },
                            \"early_arrival_required\": true,
                            \"cover_required\": true
                        },
                        \"animals\": {
                            \"fees\": {
                                \"type\": \"unknown\",
                                \"amount\": null,
                                \"percent\": null
                            },
                            \"main_compartment_allowed\": false,
                            \"hold_compartment_allowed\": false,
                            \"main_max_weight_kg\": null,
                            \"main_small_cage_required\": null,
                            \"hold_max_weight_kg\": null,
                            \"vaccination_required\": true,
                            \"special_animals_allowed\": true,
                            \"early_arrival_required\": true,
                            \"specific_hours\": null
                        },
                        \"refund_policies\": [
                            {
                                \"type\": \"self-serve\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": 0.25,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"refund\": true,
                        \"refund_cutoff\": 1,
                        \"exchange_policies\": [
                            {
                                \"type\": \"station\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": null,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"exchange\": true,
                        \"exchange_cutoff\": 1,
                        \"exchange_cutoff_at\": \"2020-11-25T20:30:00.000Z\",
                        \"refund_cutoff_at\": \"2020-11-25T20:30:00.000Z\",
                        \"currency\": \"CAD\",
                        \"addons\": {},
                        \"piece_of_id\": true,
                        \"boarding_requirement\": \"printed_or_mobile_tkt\",
                        \"extra_bag_policy\": true,
                        \"extra_bag_cost\": 500,
                        \"extra_bag_kg_cost\": null,
                        \"bag_allowed\": true
                    }
                },
                {
                    \"amenities\": {
                        \"display_name\": \"Flex\",
                        \"wifi\": false,
                        \"toilet\": true,
                        \"ac\": true,
                        \"refreshment\": false,
                        \"food\": false,
                        \"hot_meal\": false,
                        \"power_outlets\": true,
                        \"tv\": false,
                        \"bus_attendant\": false,
                        \"leg_room\": true,
                        \"small_seat\": false,
                        \"average_seat\": true,
                        \"xl_seat\": false,
                        \"full_recline_seat\": false,
                        \"carpool\": false
                    },
                    \"arrival_timezone\": \"America/Montreal\",
                    \"available_seats\": 22,
                    \"vehicle\": null,
                    \"busbud_departure_id\": \"1c973ea1\",
                    \"class\": \"FLEX\",
                    \"class_name\": \"Flex\",
                    \"complete\": false,
                    \"contractor_name\": null,
                    \"fare_name\": null,
                    \"deeplink\": null,
                    \"departure_timezone\": \"America/Montreal\",
                    \"departure_type\": \"editable-refundable\",
                    \"destination_location_id\": 1938,
                    \"duration\": 195,
                    \"has_search_details\": false,
                    \"has_layout\": null,
                    \"has_transfers\": false,
                    \"has_addons\": null,
                    \"id\": \"ODdkZTgxNWM6MWM5NzNlYTE\",
                    \"links\": {
                        \"deeplink\": \"https://www.busbud.com/en/deeplink/f2m673/f25dvk/ODdkZTgxNWM6MWM5NzNlYTE?outbound_date=2020-11-25&return_date&adults=1&children=0&seniors=0&child_ages=&senior_ages=&discount_code&utm_source={utm_source}&utm_campaign={utm_campaign}&utm_medium={utm_medium}\"
                    },
                    \"num_transfers\": 0,
                    \"operator_id\": \"a7ad22de-ad5b-4408-abce-ded634595698\",
                    \"origin_location_id\": 12189,
                    \"passenger_questions\": [],
                    \"schedule_id\": null,
                    \"sellable\": true,
                    \"source_id\": 262,
                    \"ticket_types\": [
                        \"eticket\"
                    ],
                    \"departure_time\": \"2020-11-25T19:30:00\",
                    \"arrival_time\": \"2020-11-25T22:45:00\",
                    \"fetched_at\": \"2020-11-01T00:31:19.392Z\",
                    \"search_request_id\": \"202011011206354362d1067f1beea4694a22d1d510e21360c6fe3d8b246d80c492642a65242b\",
                    \"unreliable_duration\": null,
                    \"has_unmapped_location\": null,
                    \"data_source\": \"l2\",
                    \"cache_source\": \"departure-service\",
                    \"operator_disclaimers\": null,
                    \"vehicle_type\": \"bus\",
                    \"bus\": null,
                    \"has_bus_details\": null,
                    \"prices\": {
                        \"currency\": \"USD\",
                        \"total\": 5285,
                        \"categories\": {
                            \"adult\": 4517
                        },
                        \"discount\": 0,
                        \"roundtrip_min\": null,
                        \"roundtrip_min_fees_included\": null,
                        \"roundtrip_total\": null,
                        \"roundtrip_total_fees_included\": null,
                        \"discounted\": null,
                        \"breakdown\": {
                            \"base\": 4517,
                            \"fees\": 92,
                            \"taxes\": 677,
                            \"discount\": 0
                        }
                    },
                    \"trip_stops\": [
                        {
                            \"arrival_time\": null,
                            \"departure_time\": \"2020-11-25T19:30:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 12189,
                            \"name\": \"Québec (centre-ville)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T20:00:00\",
                            \"departure_time\": \"2020-11-25T20:00:00\",
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 17507,
                            \"name\": \"Québec (Sainte-Foy)\",
                            \"transfer\": false
                        },
                        {
                            \"arrival_time\": \"2020-11-25T22:45:00\",
                            \"departure_time\": null,
                            \"duration\": 0,
                            \"departure_operator_id\": null,
                            \"location_id\": 1938,
                            \"name\": \"Montréal (centre-ville)\",
                            \"transfer\": false
                        }
                    ],
                    \"addons\": [],
                    \"details\": {},
                    \"terms\": {
                        \"type_of_id\": \"photo_and_full_name\",
                        \"ticket_requirements\": {
                            \"eticket\": \"printed_or_mobile_tkt\"
                        },
                        \"nb_carry_on\": 1,
                        \"kg_by_carry_on\": null,
                        \"nb_checked_bags\": 2,
                        \"kg_by_bag\": 34,
                        \"checked_in_size_cm\": {
                            \"l\": 60,
                            \"w\": 60,
                            \"h\": 90
                        },
                        \"extra_checked_in_fees\": {
                            \"type\": \"per_extra_checked_in\",
                            \"amount\": 500
                        },
                        \"nb_extra_checked_in\": null,
                        \"total_checked_in_kg\": null,
                        \"oversized_luggage\": {
                            \"allowed\": true,
                            \"allowed_types\": [],
                            \"fees\": {
                                \"type\": \"flat_fee\",
                                \"amount\": 500
                            },
                            \"early_arrival_required\": true,
                            \"cover_required\": true
                        },
                        \"animals\": {
                            \"fees\": {
                                \"type\": \"unknown\",
                                \"amount\": null,
                                \"percent\": null
                            },
                            \"main_compartment_allowed\": false,
                            \"hold_compartment_allowed\": false,
                            \"main_max_weight_kg\": null,
                            \"main_small_cage_required\": null,
                            \"hold_max_weight_kg\": null,
                            \"vaccination_required\": true,
                            \"special_animals_allowed\": true,
                            \"early_arrival_required\": true,
                            \"specific_hours\": null
                        },
                        \"refund_policies\": [
                            {
                                \"type\": \"self-serve\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": 0.25,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"refund\": true,
                        \"refund_cutoff\": 1,
                        \"exchange_policies\": [
                            {
                                \"type\": \"station\",
                                \"flat_fee\": null,
                                \"flat_fee_currency\": \"CAD\",
                                \"percent_fee\": null,
                                \"cutoff_reference\": \"departure-date\",
                                \"cutoff_from\": null,
                                \"cutoff_to\": 1,
                                \"external_link\": null
                            }
                        ],
                        \"exchange\": true,
                        \"exchange_cutoff\": 1,
                        \"exchange_cutoff_at\": \"2020-11-25T23:30:00.000Z\",
                        \"refund_cutoff_at\": \"2020-11-25T23:30:00.000Z\",
                        \"currency\": \"CAD\",
                        \"addons\": {},
                        \"piece_of_id\": true,
                        \"boarding_requirement\": \"printed_or_mobile_tkt\",
                        \"extra_bag_policy\": true,
                        \"extra_bag_cost\": 500,
                        \"extra_bag_kg_cost\": null,
                        \"bag_allowed\": true
                    }
                }
            ],
        \"search_request_ids\": [
        \"2020102823572ce9850d6b3e2467fcc628ab4b653b30c97740c9bd157237682fa03eca7ebd09\"
        ],
        \"complete\": false,
        \"ttl\": 600,
        \"is_valid_route\": true
        }
        """
}
