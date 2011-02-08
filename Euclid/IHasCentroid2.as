// -----------------------------------------------------------------------
//  Copyright (c) 2011, Louis Tovar -- gltovar.com 
//
//  Based on the open source project from:
//
//  Copyright (c) 2011, The Outercurve Foundation.  
//  This software is released under the Apache License, Version 2.0. 
//  The license and further copyright text can be found in the file LICENSE.TXT at
//  the root directory of the distribution.
// -----------------------------------------------------------------------

package Euclid
{
	import flash.geom.Point;

	/**
	 * class may have a defined centroid 
	 * can be applied to an object of any number of points including 1
	 */
	public interface IHasCentroid2
	{
		/**
		 * if no points returns null
		 * if no coordinates for the points returns null
		 * if some points have no coordinates it is up to the class to announce its
		 * strategy.
		 * Centroid is not weighted by mass
		 * @return centroid
		 */
		function GetCentroid():Point;
		
		/**
		 *list of centroid of a components of this
		 * 
		 * allows a compound object to return those subcomponents (e.g. bonds in a ring)
		 * if object is primitive (e.g. an atom) returns null;
		 * @return  null if object has no subcentroids and no coordinates
		 */		
		function GetSubCentroids():Vector<IHasCentroid2>;
	}
}