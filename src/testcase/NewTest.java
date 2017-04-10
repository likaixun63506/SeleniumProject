package testcase;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.Test;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.AfterTest;

import utility.Log;

public class NewTest {
	WebDriver driver;

	@Test
	public void f() throws InterruptedException {
		driver = new FirefoxDriver();
		driver.get("http://mail.163.com/");
	    driver.findElement(By.id("lbNormal")).click();
		driver.switchTo().frame("x-URS-iframe");
	    driver.findElement(By.xpath("//input[1]")).sendKeys("yyqqq20");
	    Thread.sleep(3000);
	    driver.findElement(By.xpath("//input[2]")).sendKeys("yanzhi000777");	   
	    driver.findElement(By.id("dologin")).click();
	    Thread.sleep(3000);
		//driver = new FirefoxDriver();
		//Log.info("firfox is pen");
		////driver.get("http://www.baidu.com/");
		////Log.info("baidu page is pen");
		//driver.quit();
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