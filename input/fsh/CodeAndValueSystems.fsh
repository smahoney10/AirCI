//Slices
CodeSystem:  AirportCodesCS
Id: airport-code-system
Title: "Airport Codes"
Description:  "A code of USA Airport Codes."
* #ABR "Aberdeen, SD"
* #ALB "Albany, NY"
* #LAX "Los Angeles, CA"
* #DCA "Washington, DC"

CodeSystem:  QuantineStationsCS
Id: quarantine-station-system
Title: "Quarantine Stations"
Description:  "A list of Quarantine Stations."
* #LAX "Los Angeles, CA"
* #MIA "Miami, FL"

ValueSet: AirportCodeVS
Title: "Airport Codes VS"
Description:  "A list of USA Airport Codes."
* include codes from system  AirportCodesCS

ValueSet: QstationsVS
Title: "Quarintine Stations VS"
Description:  "A list of all US Quarantine Stations."
* include codes from system  QuantineStationsCS


