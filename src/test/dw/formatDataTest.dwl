%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from formatData
var indata = {
  "ResourceType": "Immunization",
  "id": "M197197986",
  "meTa": {
    "versionId": "1K0",
    "lastUpdated": "2022-05-05T08:05:34+00:00"
  }
}
var indata2 = [{
  "ResourceType": "Immunization",
  "id": "M197197986",
  "meTa": {
    "versionId": "1K0",
    "lastUpdated": "2022-05-05T08:05:34+00:00"
  }
}]
var indata3 = [{
  "ResourceType": "Immunization",
  "id": "M197197986",
  "meTa": {
    "versionId": "1K0",
    "lastUpdated": "2022-05-05T08:05:34+00:00"
  }
},
{
  "ResourceType": "Immunization",
  "id": "M197197986",
  "meTa": {
    "versionId": "1K0",
    "lastUpdated": "2022-05-05T08:05:34+00:00"
  }
}]
---
"formatData" describedBy [
    "formatData" describedBy [
        "It should conver values into lower case" in do {
            formatData(indata,"lowervalue",null,null) must beObject()
        },
        "It should conver keys into upper case" in do {
            formatData(indata2,"upperkey",null,null) must beArray()
        },
        "It should conver values from a to -" in do {
            formatData(indata3,"change","a","-") must beArray()
        },
    ],
]
