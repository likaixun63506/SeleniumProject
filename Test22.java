package day09;


import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

public class Test22 {
   // WebDriver driver;
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
	@Test
	public void testa() throws Exception {
		driver.get("http://172.166.100.59/ws/ecshop/upload/index.php");
		driver.findElement
		(By.xpath("//input[@id='keyword']")).sendKeys("a");
		driver.findElement
		(By.xpath("//input[@name='imageField']")).click();
		driver.findElement
		(By.xpath("//div[@class='goodsItem'][last()]/a[1]/img")).click();
		driver.findElement(
		 By.xpath("//img[contains(@src,'bnt_cat.gif')]")).click();
		Thread.sleep(5000);
		driver.findElement(By.xpath(".//input[contains(@id,'goods_number')]")).clear();
		driver.findElement(By.xpath(".//input[contains(@id,'goods_number')]")).sendKeys("3");
		Thread.sleep(5000);
		driver.findElement
		(By.xpath("//a[text()='É¾³ý']")).click();
		Thread.sleep(5000);
		assertTrue(isAlertPresent());
		closeAlertAndGetItsText();
		Thread.sleep(3000);
	}
	@After
	public void tearDown() throws Exception {
		driver.quit();
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
	  

}
