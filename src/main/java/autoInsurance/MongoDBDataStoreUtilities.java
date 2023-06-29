package autoInsurance;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.util.ArrayList;



public class MongoDBDataStoreUtilities {
    static DBCollection myInsuranceReviews;
    public static DBCollection getConnection()
    {
        MongoClient mongo1 = new MongoClient("localhost", 27017);
        DB db =mongo1.getDB("InsuranceProj");
        myInsuranceReviews=db.getCollection("myReviews");
        return myInsuranceReviews;
    }

    public static String insertReview(String name,String emailid,String PhoneNumber,String ZipCode,String type1,String input)
    {
	try
		{		
			getConnection();
			BasicDBObject doc = new BasicDBObject("title", "myInsuranceReviews").
				append("name", name).
				append("emailid", emailid).
				append("PhoneNumber", PhoneNumber).
				append("ZipCode", ZipCode).
				append("type1",type1).
                append("Input",input);
			myInsuranceReviews.insert(doc);
			return "Successfull";
		}
		catch(Exception e)
		{
		return "UnSuccessfull";
		}	

    }
	public static ArrayList <Mostsoldzip> mostsoldZip(){
	  ArrayList <Mostsoldzip> mostsoldzip = new ArrayList <Mostsoldzip> ();
	  try{
		  
	  getConnection();
      DBObject groupProducts = new BasicDBObject("_id","$ZipCode"); 
	  groupProducts.put("count",new BasicDBObject("$sum",1));	
	  DBObject group = new BasicDBObject("$group",groupProducts);
	  DBObject limit=new BasicDBObject();
      limit=new BasicDBObject("$limit",5);
		
	  DBObject sortFields = new BasicDBObject("count",-1);
	  DBObject sort = new BasicDBObject("$sort",sortFields);
	  AggregationOutput output = myInsuranceReviews.aggregate(group,sort,limit);
      for (DBObject res : output.results()) {
		String zipcode =(res.get("_id")).toString();
        String count = (res.get("count")).toString();	
        Mostsoldzip mostsldzip = new Mostsoldzip(zipcode,count);
		mostsoldzip.add(mostsldzip);
	
	  }
	  
	}catch (Exception e){ System.out.println(e.getMessage());}
      return mostsoldzip;
  }
}
