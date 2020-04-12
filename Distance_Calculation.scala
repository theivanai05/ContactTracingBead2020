package com.dataflair.spark
//Credit for Class DistanceCalculatorImpl definition : https://shiv4nsh.wordpress.com/2017/12/01/scala-calculating-distance-between-two-locations/

object Distance_Calculation {

  def main(args: Array[String]) {
   System.out.println("Calling the Distance Calculator")
   
   //Normal DD Values as Input
   /*
    val Return_Great_Circle_Distance_MenDivya = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location(1.2923152999999998,103.7766355),Location(1.2922657,103.7766233))   
    val Return_Great_Circle_Distance_MenShankar = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location(1.2923152999999998,103.7766355),Location(1.2916518,103.7772552))   
    val Return_Great_Circle_Distance_DivyanShankar = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location(1.2922657,103.7766233),Location(1.2916518,103.7772552))  
    */
   
    val Return_Great_Circle_Distance_MenDivya = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location((1.2923152999999998*1e7),(103.7766355*1e7)),Location((1.2922657*1e7),(103.7766233*1e7)))   
    val Return_Great_Circle_Distance_MenShankar = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location((1.2923152999999998*1e7),(103.7766355*1e7)),Location((1.2916518*1e7),(103.7772552*1e7)))   
    val Return_Great_Circle_Distance_DivyanShankar = new DistanceCalculatorImpl().calculateDistanceInKilometer(Location((1.2922657*1e7),(103.7766233*1e7)),Location((1.2916518*1e7),(103.7772552*1e7)))  
    
    print("Great Circle Distance in Meters between : T::D = " + Return_Great_Circle_Distance_MenDivya + " T::S = " +  Return_Great_Circle_Distance_MenShankar  + " D::S = "  + Return_Great_Circle_Distance_DivyanShankar)                                        
    
    
    // Value provided is in UTM; https://www.latlong.net/lat-long-utm.html
    val Return_Euclidean_Distance = new EuclideanDistanceCalculatorImpl().calculateDistanceInKilometer(Location((1.2923152999999998*1e7),(103.7766355*1e7)),Location((1.2922657*1e7),(103.7766233*1e7))) 
    println()
    print("Euclidean Distance in Meters between T::D " + Return_Euclidean_Distance)

  }
}

//Theiv Latitude: 1.2923152999999998, Longtitude: 103.7766355 ==> 29 Heng Mui Keng 
//Shankar : latitude: 1.2910902, longitude:103.778091 ==> 25 Heng Mui Keng 
//Divya latitude = 1.2922657, Longitude = 103.7766233 ==> Heng Mui Keng 

case class Location(lat: Double, lon: Double)

trait DistanceCalcular {
  def calculateDistanceInKilometer(fromLocation: Location, toLocation: Location): Float
}

class DistanceCalculatorImpl extends DistanceCalcular {

  private val AVERAGE_RADIUS_OF_EARTH_KM: Int = 6371

  override def calculateDistanceInKilometer(fromLocation: Location, toLocation: Location): Float= {
    val latDistance = Math.toRadians(fromLocation.lat/1e7 - toLocation.lat/1e7)
    val lngDistance = Math.toRadians(fromLocation.lon/1e7 - toLocation.lon/1e7)
    val sinLat = Math.sin(latDistance / 2)
    val sinLng = Math.sin(lngDistance / 2)
    val a = sinLat * sinLat +
      (Math.cos(Math.toRadians(fromLocation.lat))
        * Math.cos(Math.toRadians(toLocation.lat))
        * sinLng * sinLng)
    val c: Double = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    val caldist: Double = if ((AVERAGE_RADIUS_OF_EARTH_KM * c ).toFloat > 2) ' ' else (AVERAGE_RADIUS_OF_EARTH_KM * c ).toFloat
    
    //println(caldist)
    caldist.toFloat*100
    //(AVERAGE_RADIUS_OF_EARTH_KM * c).toFloat
  }
}

class EuclideanDistanceCalculatorImpl extends DistanceCalcular {
  //math.sqrt(math.pow((x1 - y1), 2) + math.pow((x2 - y2), 2))
  //If the places in question are not far apart, then you can convert the lat/long to UTM and then use the normal formula for Euclidean Distance:
  //d=sqrt((x1-x2)^2+(y1-y2)^2)
  //https://stackoverflow.com/questions/28949591/easiest-way-to-represent-euclidean-distance-in-scala
  override def calculateDistanceInKilometer(fromLocation: Location, toLocation: Location): Float = {
    //Treatment for LatitudeE7 and LongtitudeE7
    val x1 = (fromLocation.lat/1e7)
    val x2 = (toLocation.lat/1e7)
    val y1 = (fromLocation.lon/1e7)
    val y2 = (toLocation.lon/1e7)
    
    val fromsq = Math.pow((x1-x2),2)
    val tosq = Math.pow((y1-y2),2)
    val forsqrtinput = fromsq + tosq
        
    val Euclidean_Distance = Math.sqrt(forsqrtinput)
    Euclidean_Distance.toFloat*10000
  }
}

