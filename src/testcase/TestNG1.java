package testcase;

import java.util.Iterator;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.testng.annotations.Test;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.AfterTest;

import utility.Log;
import utility.ReadExcelData;

public class TestNG1 {//从Excel中读取
	WebDriver driver;

	@Test
	public void f() throws InterruptedException {
		 driver = new FirefoxDriver();
	     driver.get("http://172.166.100.103:85/general");
	     Thread.sleep(1000);
		 Log.info("firfox is pen");
		 driver.findElement(By.name("account")).sendKeys(ReadExcelData.getTestData("valid_username"));
		 driver.findElement(By.id("submit")).click();
		 Thread.sleep(2000);
		 Log.info("website is logged on");
		 
		 driver.findElement(By.xpath(".//*[@id='r1']/ul/li[5]/table/tbody/tr/td[2]")).click();
	     Thread.sleep(1000);
	     driver.findElement(By.xpath(".//*[@id='m09']/ul/li[1]/div[1]")).click();
	     Thread.sleep(1000);
	     driver.findElement(By.xpath(".//*[@id='m09']/ul/li[1]/div[2]/ul/li[4]/span")).click();
	     Thread.sleep(1000);
	     driver.switchTo().frame("context");
	     driver.findElement(By.xpath("html/body/div[1]/div[1]/div/div[2]/span[1]")).click();
	     Thread.sleep(1000);     
	     driver.findElement(By.name("pro_name")).sendKeys("a");
	     Thread.sleep(1000);
	     WebElement element=driver.findElement(By.id("_3_"));
		    //封装select对象
		 Select select=new Select(element);
		    //选择财务用品
		 select.selectByVisibleText("财务用品");
		 Thread.sleep(1000);
	     driver.findElement(By.name("pro_unit")).sendKeys("a");
	     Thread.sleep(1000);
	     driver.findElement(By.name("pro_supplier")).sendKeys("a");
	     Thread.sleep(1000);
	     driver.findElement(By.name("pro_desc")).sendKeys("a");
	     Thread.sleep(1000);
	   //点击button，打开新窗口
		 driver.findElement(By.xpath(".//*[@id='_5_']/div[1]/span[1]")).click();
		 ////获取当前句柄
		 String ori=driver.getWindowHandle(); 
		//获取所有句柄，返回一个集合
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
		 driver.switchTo().frame("head");
		 driver.findElement(By.xpath(".//*[@id='D132']/a")).click();
		 Thread.sleep(2000);
			//关闭新窗口
		 driver.close();
			//切换为原窗口
	     driver.switchTo().window(ori);
	     Thread.sleep(3000);
    }

	@BeforeTest
	public void beforeTest() {
		System.setProperty("webdriver.firefox.bin", "D:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe");
		
	}

	@AfterTest
	public void afterTest() {
		driver.quit();
	}

}
	  
