/**
* This mapping won't be shared through your library, but you can use it to try out your module and create integration tests.
*/
%dw 2.0
output application/json

import * from formatData
var indata = {
  "ResourceType": "Immunization",
  "id": "M197197986",
  "meTa": {
    "versionId": "1K0",
    "lastUpdated": "2022-05-05T08:05:34+00:00"
  }
}
---
formatData(indata,"upperkey",null,null)
