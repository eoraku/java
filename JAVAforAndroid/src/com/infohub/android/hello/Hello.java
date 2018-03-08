package com.infohub.android.hello;

public class Hello {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println("java4android");
		double latitude1   = 37.52127220511242;
		double longtitude1 = 127.0074462890625;
		double latitude2   = 35.137879119634185;
		double longtitude2 = 129.04541015625;
		
		double distancd = HaversineDistance(latitude1, longtitude1, latitude2, longtitude2);
		System.out.println(distancd);
	}
	
	public static double HaversineDistance(double lat1, double lng1, double lat2, double lng2) {
		double earthR = 6371; //km
		double dLat = lat2-lat1;
		double dLng = lng2-lng1;
		double a = Math.sin(Math.toRadians(dLat/2)) * Math.sin(Math.toRadians(dLat/2)) +
				Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
				Math.sin(Math.toRadians(dLng/2))*Math.sin(Math.toRadians(dLng/2));
		double c = 2 * Math.asin(Math.sqrt(a));
		//double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double d = earthR * c;
		
		return d;
	}

}
