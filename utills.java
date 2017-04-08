package utility;

import java.util.Iterator;
import java.util.Set;

import org.openqa.selenium.WebDriver;

public class utills {
public static WebDriver driver;	
	
/**
 * This method implements how to switch windows	
 * @author xjjiang
 * @param cwindow
 */
public static void switchWindows(String cwindow){
		
		Set<String> Ahandles = driver.getWindowHandles();
		Iterator<String> Ait = Ahandles.iterator();
		while(Ait.hasNext()){
			String crWindowString = Ait.next();
			System.out.println("next = " + crWindowString);
			if(cwindow==crWindowString){
				continue;
			}
			driver.switchTo().window(crWindowString); 
		}
	}
/**
 * This method implemenets how to get the specified test data based on the column name(key).
 * @param key
 * @return
 */
public static String getTestData(String key){
	ExcelData.setPath(Contants.path+Contants.filename, Contants.sheetname);
	int rowNum = ExcelData.getRowContains(key, Contants.keycolumn);
	String cellValue = ExcelData.getCellData(rowNum, Contants.column);
	return cellValue;
	
}

public static String getCSVTestData(String key){
	String vlaue = null;
	for(String[] row:ExcelData.getLocatorsFromObjectsFile()){
		if(row[0].equalsIgnoreCase(key)){
			vlaue = row[1];

		}
	}
	return vlaue;
}

}
