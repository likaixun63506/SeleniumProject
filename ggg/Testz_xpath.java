package com.tarena.selenium;


import static org.junit.Assert.*;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

public class Testz_xpath {
   WebDriver driver;
   private boolean acceptNextAlert = true;
	@Before
	public void setUp() throws Exception {
		FirefoxProfile profile = new FirefoxProfile();
		  profile.setPreference(
	  		"dom.ipc.plugins.enabled", 
	  		false);
		driver = new FirefoxDriver(profile);
	   driver.manage().window().maximize();
	}

	@After
	public void tearDown() throws Exception {
	   driver.quit();
	}
	@Test
	public void testa() throws Exception {
		driver.get("http://172.166.100.59/ws/ecshop/upload/index.php");
		driver.findElement(By.xpath(".//*[@id='ECS_MEMBERZONE']/a[2]/img")).click();
		String timestamp = getCurrentTime();
		String username = "jiangxj"+timestamp;
		driver.findElement(By.id("username")).sendKeys(username);
		System.out.println(timestamp);
		Thread.sleep(3000);
		//后退
		driver.navigate().back();
		Thread.sleep(3000);
		//前进
		driver.navigate().forward();
		Thread.sleep(3000);
	}
	@Test
	public void testb() throws Exception {
		driver.get("file:///E:/Selenium/example/newWindow.html");
		driver.findElement(By.linkText("2链接到id.html")).click();
		String origi = driver.getWindowHandle();
		Set<String> allwins = driver.getWindowHandles();
		Iterator<String> its = allwins.iterator();
		while(its.hasNext()){
			String cwh = its.next();			
			if(!cwh.equals(origi)){
				driver.switchTo().window(cwh);
				break;
			}
			
		}
		driver.findElement(By.id("username")).sendKeys("abc");
		Thread.sleep(3000);
		driver.close();
		driver.switchTo().window(origi);
		driver.findElement(By.linkText("3链接到name.html")).click();
		Thread.sleep(3000);
		driver.switchTo().window("windName");
		driver.findElement(By.name("username")).sendKeys("bcd");
		Thread.sleep(3000);
	}
	@Test
	public void testc() throws Exception {
		driver.get("http://172.166.100.59/ws/ecshop/upload/index.php");
		driver.findElement(By.xpath("//font[@id='ECS_MEMBERZONE']/a[1]/img")).click();
		driver.findElement(By.xpath("//input[@name='username']")).sendKeys("abc");
		driver.findElement(By.xpath("//input[@name='password']")).sendKeys("bcd");
		driver.findElement(By.xpath("//input[@class='us_Submit']")).click();
		Thread.sleep(3000);
	}
	@Test
	public void testd() throws InterruptedException{
		driver.get("file:///E:/Selenium/example/Wait.html");
		driver.findElement(By.id("b")).click();
		Thread.sleep(5000);
		assertEquals("结果",driver.findElement(By.id("result")).getText());
	}
	
	
	@Test
	public void teste() throws Exception {
		driver.get("http://172.166.100.59/ws/ecshop/upload/index.php");
		driver.findElement(By.xpath("//form[@id='searchForm']/input[1]")).sendKeys("a");
		driver.findElement(By.xpath("//input[@name='imageField']")).click();
		driver.findElement(By.xpath("//div[@class='goodsItem'][last()]/a[1]/img")).click();
		driver.findElement(By.xpath("//img[contains(@src,'bnt_cat.gif')]")).click();
		//goods_number_67 id是变化的所以用contains
		//driver.findElement(By.xpath("//*[id='goods_number_67']")).clear();
		Thread.sleep(5000);
		driver.findElement(By.xpath(".//input[contains(@id,'goods_number')]")).clear();
		
		driver.findElement(By.xpath(".//input[contains(@id,'goods_number')]")).sendKeys("3");
		Thread.sleep(5000);
		driver.findElement(By.xpath("//a[text()='删除']")).click();
		assertTrue(isAlertPresent());
		Thread.sleep(3000);
	}
	
	@Test
	public void testaa() throws Exception {
		driver.get("file:///E:/Selenium/example/example/table.html");
		List<WebElement> lists=driver.findElements(By.tagName("tr"));
		assertEquals(6,lists.size());
		Thread.sleep(3000);
		//断言第四行的列数 方法一
		List<WebElement> cols=driver.findElements(By.xpath("//table/tbody/tr[4]/td"));
		assertEquals(3,cols.size());
		//断言第四行的列数 方法二
		List<WebElement> cols4=lists.get(3).findElements(By.tagName("td"));
		assertEquals(3,cols4.size());
		//断言表格三行第二列
	    String text=driver.findElement(By.xpath("//table/tbody/tr[3]/td[2]")).getText();
	    assertEquals("$30.00",text);
	}
	
	@Test
	public void testbb() throws Exception {
		driver.get("file:///E:/Selenium/example/example/table2.html");
		//表格行数
		List<WebElement> lists=driver.findElements(By.xpath("html/body/table[1]/tbody/tr"));
		assertEquals(2,lists.size());
		Thread.sleep(3000);
		
		//获取第一个table 中第一行包含几个表头
		List<WebElement> ths= lists.get(0).findElements(By.tagName("th"));
		assertEquals(2,ths.size());
		//获取第二个table 中第二行的列数（td和th）
		List<WebElement> hds=driver.findElements(By.xpath("//table[2]/tbody/tr[2]/*"));
		assertEquals(2,hds.size());
		//断言第二个table中第二行第一个数据文本  //table[2]/tbody/tr[2]/td
		
		//List<WebElement> tds=list2.
	}
	private boolean isAlertPresent() {
	    try {
	      driver.switchTo().alert();
	      return true;
	    } catch (NoAlertPresentException e) {
	      return false;
	    }
	  }

	private String closeAlertAndGetItsText() {
	    try {
	      Alert alert = driver.switchTo().alert();
	      String alertText = alert.getText();
	      if (acceptNextAlert) {
	        alert.accept();
	      } else {
	        alert.dismiss();
	      }
	      return alertText;
	    } finally {
	      acceptNextAlert = true;
	    }
	  }
	private String getCurrentTime(){
		Calendar ca = Calendar.getInstance();
		String y =String.valueOf(ca.get(Calendar.YEAR));
		String m = String.valueOf(ca.get(Calendar.MONTH));
		String d = String.valueOf(ca.get(Calendar.DATE));
		String h = String.valueOf(ca.get(Calendar.HOUR_OF_DAY));
		String mm = String.valueOf(ca.get(Calendar.MINUTE));
		String s = String.valueOf(ca.get(Calendar.SECOND));
	    return y+m+d+h+mm+s;
		
	}  
	
}
