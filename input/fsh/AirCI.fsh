// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.

Profile: Traveler
Parent: $USCorePatient
Description: "An profile of a Traveler."
* name 1..* MS

Profile: IllTravelerBundle
Parent: Bundle  
Description: "A bundle of resources related to a report of an ill traveler."
* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    Labs 0..* and
    TravelerInfo 1..1 and
    FlightInfo 0..* and
    DiseaseInfo 0..1
* entry[Labs].resource only $USCoreObservationLab
* entry[Labs] ^short = "the labs"
* entry[Labs] ^definition = "The labs supporting the diagnosis of the disease."
* entry[TravelerInfo].resource only Traveler
* entry[TravelerInfo] ^short = "Traveler Info"
* entry[TravelerInfo] ^definition = "Information about the travler who is sick"
* entry[TravelerInfo].resource 1..1
* entry[TravelerInfo].request 1..1
* entry[FlightInfo].resource only FlightItinerary
* entry[FlightInfo] ^short = "the documents"
* entry[FlightInfo] ^definition = "the documents referenced by the DocumentReference resources"
* entry[DiseaseInfo].resource only InfectiousDisease
* entry[DiseaseInfo] ^short = "Disease"
* entry[DiseaseInfo] ^definition = "the Disease"
* entry[DiseaseInfo].resource 0..1

Profile: ReportOfIllTraveler
Parent: Composition
Description: "Report of an ill traveler"
* subject 1..1
* extension contains 
    DateTransferedToQstation named qstation-transfer-date 0..1 MS and
    Qstation named qstation-name 0..1 MS
* extension[qstation-transfer-date] ^short = "Date transferred to Q-Station"
* extension[qstation-name] ^short = "Date transferred to Q-Station"
* title = "Report of Ill Traveler"
* implicitRules 0..1
* contained 0..0
* encounter 0..0
* confidentiality 0..0
* type = #55751-2 "Public health Case report"
* relatesTo 0..1
* event 0..1
* section 0..1
* status = #final
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
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.description = ""
* section ^slicing.ordered = false
* section contains
  flightItinerary 0..1 and
  infectiousDisease 0..1
* section[flightItinerary].entry only Reference(FlightItinerary) 
* section[flightItinerary].title = "Flight details for the ill Traveler"
* section[infectiousDisease].entry only Reference(InfectiousDisease) 
* section[infectiousDisease].title = "Information about the Infectious Disease, including labs and x-rays"



Profile: FlightItinerary
Parent: $eCRTransportation
Description: "Flight information for an ill traveler"
* value[x] only CodeableConcept
* value[x] = http://snomed.info/sct#261325004 "Airliner"  //Airplane travel
* status = #preliminary
* extension contains
  FlightDetail named flight-detail 0..*



Profile: InfectiousDisease
Parent: Condition
Description: "The Infectious Disease profile sets minimum expectations for the Observation Resource to record, important information about an Infections Disease associated with an Ill Traveler"
* subject only Reference(Traveler)
* extension contains
  InfectiousDiseaseName named infectious-disease-name 1..1 MS 
* extension[infectious-disease-name] ^short = "Name of the Infectious Disease"
* evidence ^slicing.discriminator.type = #value
* evidence ^slicing.discriminator.path = "code"
* evidence ^slicing.rules = #open
* evidence ^slicing.description = ""
* evidence ^slicing.ordered = false
* evidence contains
  tuberculosis 0..1 and
  measles 0..1 
* evidence[tuberculosis].code from TuberculosisVS
* evidence[measles].code from AirportCodeVS
* evidence[tuberculosis].extension contains ChestXrayResults named chestXrayResults 0..1
* evidence[measles].extension contains RashOnsetDate named RashOnsetDate 0..1