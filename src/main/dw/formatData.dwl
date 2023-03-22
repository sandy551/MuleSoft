/**
* This module will be shared through your library, feel free to modify it as you please.
*
* You can try it out with the mapping on the src/test/dw directory.
*/
%dw 2.0

//change the key/value to upper case condition to change key then inType is 'upperkey' if change value then inType is 'uppervalue'
fun upperData(inData,inType,from,to) = (
    inData mapObject ((value, key, index) -> {
        (if(lower(inType) ~= "upperkey")upper(key) else key) : (
            if(value is Array)keyformatArray(value,inType,from,to)
            else if(value is Object)upperData(value,inType,from,to)
            else if(lower(inType) ~= "uppervalue")upper(value) else value)
            
            }))

//change the key/value to lower case condition to change key then inType is 'lowerkey' if change value then inType is 'lowervalue'
fun lowerData(inData,inType,from,to) = (
    inData mapObject ((value, key, index) -> {
        (if(lower(inType) ~= "lowerkey")lower(key) else key) : (
            if(value is Array)keyformatArray(value,inType,from,to)
            else if(value is Object)lowerData(value,inType,from,to)
            else if(lower(inType) ~= "lowervalue")lower(value) else value)
            
            }))

//change the value from value to value then pass 3rd and 4th parameter in formatData function 3rd postion indicates from value 4th parameter indicates to value
fun change(inData,inType,from,to) = (
    inData mapObject ((value, key, index) -> {
        (key) : (
            if(value is Array)keyformatArray(value,inType,from,to)
            else if(value is Object)change(value,inType,from,to)
            else value replace (from default "") with (to default "")
            )
            }))

fun keyformatArray(inData,inType,from,to) = (
    inData map ((item, index) ->formatData(item,inType,from,to))
    )
/**
* Describes the `formatData` function purpose.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `inData` | Object or Array of Objects | 
* | `inType` | String | it work based on upperkey or uppervalue or lowerkey or lowervalue or change
* | `from` | String or null | if inType is change need to pass this value otherwise null
* | `to` | String or null | if inType is change need to pass this value otherwise null
* |===
*
* === Example
*
* This example shows how the `formatData` function behaves under different inputs.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* 
* import * from formatData
* var indata = {
*   "ResourceType": "Immunization",
*  "id": "M197197986",
*  "meTa": {
*    "versionId": "1K0",
*    "lastUpdated": "2022-05-05T08:05:34+00:00"
*  }
* }
* ---
* formatData(indata,"upperKey",null,null)
*
* ----
*
* ==== Output
*
* {
* "RESOURCETYPE": "Immunization",
* "ID": "M197197986",
* "META": {
*   "VERSIONID": "1K0",
*   "LASTUPDATED": "2022-05-05T08:05:34+00:00"
*  }
* }
* ----
*
* ----
*
*/
fun formatData(inData,inType,from,to) =(
    if(inData is Array)keyformatArray(inData,inType,from,to)
    else if(inData is Object)(
        if(lower(inType) contains "upper") upperData(inData,inType,from,to)
        else if(lower(inType) contains "lower") lowerData(inData,inType,from,to)
        else if( inType contains "change") change(inData,inType,from,to)
        else
        inData
    )
    else inData
    )