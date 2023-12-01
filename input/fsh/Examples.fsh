Instance: ReportOfIllTravelerExample
InstanceOf: ReportOfIllTraveler
Description: "An example of a report of an ill traveler."
* author[stateContact] = Reference(StateExample)
* status = #final
* subject = Reference(travelerExample)
* date = "2023-12-03T19:43:30.000Z"
* section[infectiousDisease].entry = Reference(TuberculosisExample)

Instance: StateExample
InstanceOf: Organization
Description: "An Example of a State Health Department"
* name = "Virginia Health Department"

Instance: travelerExample
InstanceOf: Traveler
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"
* gender = #Male
* identifier.use = #usual
* identifier.type = $IdType#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "1234"
/*
Instance: FlightExample1
InstanceOf: FlightItinerary1
Description: "An example of a flight info."
* component[+].code.text = "Departure Airport"
* component.valueString[+] = "LAX"
* component[1].code.text = "Arrival Airport"
* component[1].valueString = "DCA"
* component[2].code.text = "Flight Number"
* component[2].valueString = "DL679"
* component[3].code.text = "Seat"
* component[3].valueString = "18F"


Instance: FlightExample
InstanceOf: FlightItinerary
Description: "An example of a flight itinerary."
* component[flight].code = $LOINC#8691-8
* component[flight].valueString = "History of Travel"
* component[flight/departureAirport].valueString = "DCA"
* component[flight/departureAirport].code = #DCA
* component[flight/arrivalAirport].valueString = "LAX"
* component[flight/arrivalAirport].code = #LAX
*/
Instance: FlightExample
InstanceOf: FlightItinerary
Description: "An example of a flight itinerary."
/** extension[flight-duration].valuestring = "3 hours"
* extension[flight-detail/departureAirport].valueString = "DCA"
* extension[flight-detail].departureAirport.code = #DCA
*/

Instance: TuberculosisExample
InstanceOf: InfectiousDisease
Description: "An example of Tuberculosis."
* extension[infectious-disease-name].valueCodeableConcept = #TB "Tuberculosis"
* subject = Reference(travelerExample)
* evidence[tuberculosis].extension[ChestXrayResults].valueReference = Reference(ChestXrayResultsExample)

Instance: ChestXrayResultsExample
InstanceOf: $USCoreObservationClinicalResult
Description: "An example of chest x-ray for Tuberculosis."
* status = #final
* subject = Reference(travelerExample)
* category = #LP29684-5	
* code = #11422-3
* effectiveDateTime = "2019-02-03T19:43:30.000Z"
* presentedForm.id = "Pulmonary_Tuberculosis_X-ray3.jpg"
