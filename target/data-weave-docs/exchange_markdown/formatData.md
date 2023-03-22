#### _formatData_
__________________________________________

This module will be shared through your library, feel free to modify it as you please.

You can try it out with the mapping on the src/test/dw directory.

# Index

### Functions
| Name | Description|
|------|------------|
| [change](#change-index ) | |
| [formatData](#formatdata-index ) | |
| [keyformatArray](#keyformatarray-index ) | |
| [lowerData](#lowerdata-index ) | |
| [upperData](#upperdata-index ) | |








__________________________________________


# Functions

## **change** [↑↑](#index )

### _change&#40;inData, inType, from, to&#41;_


__________________________________________


## **formatData** [↑↑](#index )

### _formatData&#40;inData, inType, from, to&#41;_

Describes the `formatData` function purpose.

##### Parameters

| Name | Type | Description|
|------|------|------------|
| `inData` | Object or Array of Objects | |
| `inType` | String | it work based on upperkey or uppervalue or lowerkey or lowervalue or change|
| `from` | String or null | if inType is change need to pass this value otherwise null|
| `to` | String or null | if inType is change need to pass this value otherwise null|


##### Example

This example shows how the `formatData` function behaves under different inputs.

###### Source

```dataweave
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
formatData(indata,"upperKey",null,null)

```

###### Output

{
"RESOURCETYPE": "Immunization",
"ID": "M197197986",
"META": {
  "VERSIONID": "1K0",
  "LASTUPDATED": "2022-05-05T08:05:34+00:00"
 }
}
```

```
__________________________________________


## **keyformatArray** [↑↑](#index )

### _keyformatArray&#40;inData, inType, from, to&#41;_


__________________________________________


## **lowerData** [↑↑](#index )

### _lowerData&#40;inData, inType, from, to&#41;_


__________________________________________


## **upperData** [↑↑](#index )

### _upperData&#40;inData, inType, from, to&#41;_


__________________________________________






