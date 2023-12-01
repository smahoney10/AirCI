//Alias: $VSACtbVS = https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1222.43/expansion
Alias: $VSACtbCS = https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1222.43/expansion



//Codesystems
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

CodeSystem:  InfectiousDiseaseNameCS
Id: infectious-disease-system
Title: "Infectious Disease"
Description:  "A list of Infectious Diseases reportable to CDC."
* #TB "Tuberculosis"
* #ME "Measles"

//valuesets
ValueSet: AirportCodeVS
Title: "Airport Codes VS"
Description:  "A list of USA Airport Codes."
* include codes from system  AirportCodesCS

ValueSet: QstationsVS
Title: "Quarintine Stations VS"
Description:  "A list of all US Quarantine Stations."
* include codes from system  QuantineStationsCS

ValueSet: TuberculosisVS
Title: "Tuberculosis VS"
Description:  "A list of all Valid Tuberculosis Codes."
* include codes from system  $VSACtbCS

ValueSet: InfectiousDiseaseNameVS
Title: "Infectious Disease VS"
Description:  "A list of all Valid Tuberculosis Codes."
* include codes from system  InfectiousDiseaseNameCS

ValueSet: InfectiousDiseaseVS
Title: "Infectious Disease VS"
Description: "Codes indicating the Infectious Disease."
* ^experimental = false
* include $SNOMEDCT#56717001 "Tuberculosis" 
