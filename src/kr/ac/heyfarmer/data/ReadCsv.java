package kr.ac.heyfarmer.data;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ReadCsv
{
	public static List<List<String>> readcsv()
	{
	    List<List<String>> ret = new ArrayList<List<String>>();
	    BufferedReader br = null;
	    
	    try
	    {
	    	// 절대경로 > 상대경로로 바꿔야 함
	        br = Files.newBufferedReader(Paths.get("C:\\Users\\2019A00296\\Desktop\\pricedata.csv"));
	        String line = "";
	        
	        while((line = br.readLine()) != null){
	            List<String> tmpList = new ArrayList<String>();
	            String array[] = line.split(",");
	            tmpList = Arrays.asList(array);
	            ret.add(tmpList);
	        }
	    }
	    catch(FileNotFoundException e)
	    {
	        e.printStackTrace();
	    }
	    catch(IOException e)
	    {
	        e.printStackTrace();
	    }
	    finally
	    {
	        try
	        {
	            if(br != null)
	            {
	                br.close();
	            }
	        }
	        catch(IOException e)
	        {
	            e.printStackTrace();
	        }
	    }
	    return ret;
	}
}