//Extensions
Extension: DateTransferedToQstation
Id: transfer-date
Title: "Ill traveler transfer date"
Description: "The date that an ill traveler was transferred to Quartintine Station"
* value[x] only date  
* value[x] 0..1 MS 

Extension: Qstation
Id: qstation-name
Title: "Q-station Name"
Description: "Name of the Q-station traveler was transferred to"
* value[x] only CodeableConcept
* valueCodeableConcept from QstationsVS (required)    
* value[x] 0..1 MS 