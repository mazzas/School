// Latest Revision: January 29, 2014
// Author: Steve Mazza
//
// Trying out my monterey.vim file to see how it works
// and learning something about MP at the same time.
//
//////////////////////////////////////////////////////

SCHEMA automated_plant_watering

// NOTE: The plant is part of the system but is completely passive
//       so is there a way to represent is as something other than
//       a NULL object?
ROOT Plant: (); 

// The following happens in an infinite loop.
// TODO: figure out how to indicate duration (e.g., for sleep())
ROOT MSP430:
        (* sleep request_moisture_reading  
        compare_moisture_reading ( water_plant ) *);

// TODO: consider what is appropriate w.r.t. descretely recognized continuous events.
ROOT Soil_Sensor: 
        (* measure_soil ( provide_moisture_reading ) *);

// NOTE: The method request_water might migrate to the MSP430 if
//       a water level sensor is added to the reservoir.  As it stands
//       currently, the pump is either able or not to draw water.
ROOT Water_Pump:
        ( request_water ( sufficient_water  pump_water | insufficient_water pump_air ) );

// NOTE: It was a bit of a stretch to include this in the system
//       definition since right now it is completely passive.  There
//       should be some opportunity to have the reservoir send the
//       user a message (e.g., via SMS) if the water falls below
//       some threshold.
ROOT Reservoir:
        (* sufficient_water supply_water | insufficient_water supply_air *);

// NOTE: This data will likely reside on the MSP430 but should be
//       abstracted, as it could easily be accessed via some 
//       central repository (e.g., the Internet) that would enable
//       comparing readings for many different types of plants.
ROOT Data: (* compare_moisture_reading *);

Data, MSP430 SHARE ALL compare_moisture_reading;
Reservoir, Water_Pump SHARE ALL sufficient_water;
Reservoir, Water_Pump SHARE ALL insufficient_water;

COORDINATE (* $x: request_moisture_reading *) FROM MSP430,
        (* $y: measure_soil *) FROM Soil_Sensor
        ADD $x PRECEDES $y;

COORDINATE (* $x: water_plant *) FROM MSP430,
        (* $z: pump_water *) FROM Water_Pump
        ADD $x PRECEDES $z;

COORDINATE (* $z: request_water *) FROM Water_Pump
        (* $w: supply_water *) FROM Reservoir
        ADD $z PRECEDES $w;

COORDINATE (* $w: supply_water *) FROM Reservoir
        (* $z: pump_water *) FROM Water_Pump
        ADD $z PRECEDES $w;

COORDINATE (* $w: supply_air *) FROM Reservoir
        (* $z: pump_air *) FROM Water_Pump
        ADD $z PRECEDES $w;
