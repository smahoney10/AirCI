// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.

Profile: Traveler
Parent: $USCorePatient
Description: "An example profile of the Patient resource."
* name 1..* MS

Profile: FlightItinerary1
Parent: $eCRTransportation
Description: "Flight info for an ill traveler"
* value[x] only CodeableConcept
* value[x] = http://snomed.info/sct#261325004 "Airliner"  //Airplane travel
* status = #preliminary

Profile: ReportOfIllTraveler
Parent: Composition
Description: "Case Report of an ill traveler"
* subject 1..1
* extension contains 
    DateTransferedToQstation named qstation-transfer-date 0..1 MS and
    Qstation named qstation-name 0..1 MS
* extension[qstation-transfer-date] ^short = "Date transferred to Q-Station"
* extension[qstation-name] ^short = "Date transferred to Q-Station"
* section 0..0
* title = "Report of Ill Traveler"
* encounter 0..0
* confidentiality 0..0
* attester 0..0
* author ^short = "Contact info for the case report"
* author only Reference(RelatedPerson or Organization)
* author  ^slicing.discriminator.type = #value
* author  ^slicing.discriminator.path = "code"
* author  ^slicing.rules = #open
* author  ^slicing.description = ""
* author  ^slicing.ordered = false
* author  contains
  stateContact 0..* and
  localContact 0..* and
  diseaseContact 0..* 
* author[stateContact] only Reference(RelatedPerson or Organization)
* author[localContact] only Reference(RelatedPerson or Organization)
* author[diseaseContact] only Reference(RelatedPerson or Organization)

Profile: FlightItinerary2
Parent: $eCRTransportation
Description: "Flight info for an ill traveler"
* value[x] only CodeableConcept
* value[x] = http://snomed.info/sct#261325004 "Airliner"  //Airplane travel
* status = #preliminary
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = ""
* component ^slicing.ordered = false
* component contains
  departureAirport 0..1 and
  arrivalAirport 0..1 and
  flightNumber 0..1 and
  seatNumber 0..1
* component[departureAirport].code from AirportCodeVS
* component[arrivalAirport].code from AirportCodeVS
* component[flightNumber].code.text = "Flight Number"
* component[seatNumber].code.text = "Seat Number"


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

Instance: FlightExample2
InstanceOf: FlightItinerary2
Description: "An example of a flight itinerary."
* component[departureAirport].code.text = "Departure Airport"
* component[departureAirport].valueString = "DCA"
* component[arrivalAirport].code =  #DCA
* component[arrivalAirport].valueString = "Washington D.C"
