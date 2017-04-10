package utility;//for 万能 ，map适合两列的

import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import junit.framework.Assert;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.Select;

public class utills {
public static WebDriver driver;
   public static void switchWindows(String ori){
	  Set<String> all=driver.getWindowHandles(); 
	  //迭代器
	  Iterator<String> its=all.iterator();
	  while(its.hasNext()){
		 String owh=its.next();
		 if(!owh.equals(ori)){
			 driver.switchTo().window(owh);
			 break;
		  }
	  }
   }
   /*
    * This method implements to find locator
    */
  public static By getlocator(String key){
	  By locat = null;
	  String LocatorType = null;
	  String locator = null;
	  for(String[] row:ReadExcelData.getLocatorsFromObjectsFile()){
		  if(row[0].equalsIgnoreCase(key)){
			  LocatorType=row[1];
			  locator=row[2];
			  break;
		  }
	  }
	  System.out.println(LocatorType +" ----  "+locator);
	  switch(LocatorType){
	  case"id":
		  locat=By.id(locator);
		  break;
	  case"name":
		  locat=By.name(locator);
		  break;
	  case"xpath":
		  locat=By.xpath(locator);
		  break;
	  case"linkText":
		  locat=By.linkText(locator);
		  break;
	  default:
		  Log.warn("Can not find the locator type.loacator type is:"+LocatorType);
		  break;
	  }
	  return locat;
  }
  public static String getTestData(String key){
		ReadExcelData.setPath(Constants.path+Constants.filename, Constants.sheetname);
		int rowNum = ReadExcelData.getRowContains(key, Constants.keycolumn);
		String cellValue = ReadExcelData.getCellData(rowNum, Constants.column);
		return cellValue;
		
	}

	public static String getCSVTestData(String key){
		String vlaue = null;
		for(String[] row:ReadExcelData.getTestDataFromObjectsFile()){
			if(row[0].equalsIgnoreCase(key)){
				vlaue = row[1];

			}
		}
		return vlaue;
	} 
	
	public static WebElement getElement(String key){	   
	   WebElement element;
	   
	   element=driver.findElement(getlocator(key));
	   if(!element.isDisplayed()){
		   Log.error("Can not find the element:"+element);
	   }
	   return element;
	}
	
	public static void inputValue(boolean flag,String value,String locator){		
		String inputData="";
		if(flag){
			   inputData=value;		
			   if(inputData!=null){
				 getElement(locator).clear();
				 getElement(locator).sendKeys(inputData);
				 Log.info("test data:"+inputData+"is input.");
		   	    }
		}
		else{
		      inputData=utills.getTestData(value);		
		      if(inputData!=null){
			     //getElement(locator).clear();
			     getElement(locator).sendKeys(inputData);
			     Log.info("test data:"+inputData+ "is input.");
	   	    }
		}
	}
	public static void openBrowser(String url,String browser){
		switch(browser){
		  case"firefox":
			  FirefoxProfile profile=new FirefoxProfile();
			  //显示浏览器的混合活动内容，http和https？？
			  profile.setPreference("security.mixed.content.block_active_content", false);
			  profile.setPreference("security.mixed.content.block_display_content", true);
			//  System.setProperty("webdriver.firefox.bin", "D:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe");
			  driver=new FirefoxDriver(profile);
			  break;
		  case"ie":
			  DesiredCapabilities ieCapabilities=DesiredCapabilities.internetExplorer();
			  //ieCapabilities.setCapability(InternetExploredDriver.INTRODUCE_F, value);
			  System.setProperty("webdriver.ie.driver", Constants.path+Constants.iedriver);
			  driver=new InternetExplorerDriver();
			  break;
		  default:
			  Log.warn("Can not find the browser type");
		   }
		  driver.get(url);
		  driver.manage().window().maximize();
		  driver.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
	}
	 
	public static void elementClick(String locator ){
		WebElement element;
		element=getElement(locator);
	    element.click();
	}
	public static void switchFrame(String id){
		driver.switchTo().frame(id);
	}
	//封装下拉框
	public static void selectValue(String flag,String value,String locator){
		WebElement element=getElement(locator);
	    //封装select对象
	    Select select=new Select(element);
	    //选择财务用品
	    if(flag.equalsIgnoreCase("byvalue")){
	    select.selectByValue(getTestData(value));
	    }else{
	    	select.selectByVisibleText(getTestData(value));
	    }
	    Log.info(getTestData(value)+"is selected");
	}
	
	//断言
	public static void assertText(String value,String locator){
		String actualValue="";
		String expectedValue="";
		actualValue=getElement(locator).getText();
		expectedValue=getTestData(value);
		Assert.assertEquals(actualValue, expectedValue,"Asset is Fail with actual data is ["+actualValue+"] and expectedValue is ["+expectedValue+"]");
		
	}
	
	//截图方法
	
	
	
	
 }
